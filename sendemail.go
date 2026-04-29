package main

import (
	"bytes"
	"encoding/base64"
	"fmt"
	"io/ioutil"
	"mime/multipart"
	"net/http"
	"net/smtp"
	"os"
	"path/filepath"
	"strings"
	"text/template"
	"time"
)

type EmailSender struct {
	auth smtp.Auth
}

type EmailMessage struct {
	To          []string
	CC          []string
	BCC         []string
	Subject     string
	Body        string
	Attachments map[string][]byte
}

type EmailTemplateData struct {
	Src     string
	Dst     string
	Date    string
	Email   string
	IsError bool
	Error   string
}

func New() *EmailSender {
	auth := smtp.PlainAuth(emailIdentity, emailUsername, emailPassword, emailHost)
	return &EmailSender{auth}
}

func (s *EmailSender) Send(m *EmailMessage) error {
	return smtp.SendMail(fmt.Sprintf("%s:%s", emailHost, emailPort), s.auth, emailFrom, m.To, m.ToBytes())
}

func NewMessage(s, b string) *EmailMessage {
	return &EmailMessage{Subject: s, Body: b, Attachments: make(map[string][]byte)}
}

func (m *EmailMessage) AttachFile(src string) error {
	b, err := ioutil.ReadFile(src)
	if err != nil {
		return err
	}

	_, fileName := filepath.Split(src)
	m.Attachments[fileName] = b
	return nil
}

func (m *EmailMessage) ToBytes() []byte {
	buf := bytes.NewBuffer(nil)
	withAttachments := len(m.Attachments) > 0
	buf.WriteString(fmt.Sprintf("Subject: %s\n", m.Subject))
	buf.WriteString(fmt.Sprintf("To: %s\n", strings.Join(m.To, ",")))
	if len(m.CC) > 0 {
		buf.WriteString(fmt.Sprintf("Cc: %s\n", strings.Join(m.CC, ",")))
	}

	if len(m.BCC) > 0 {
		buf.WriteString(fmt.Sprintf("Bcc: %s\n", strings.Join(m.BCC, ",")))
	}
	buf.WriteString("MIME-version: 1.0;\n")
	writer := multipart.NewWriter(buf)
	boundary := writer.Boundary()
	if withAttachments {
		buf.WriteString(fmt.Sprintf("Content-Type: multipart/mixed; boundary=%s\n", boundary))
		buf.WriteString(fmt.Sprintf("--%s\n", boundary))
	} else {
		buf.WriteString("Content-Type: text/html; charset=\"UTF-8\";\n\n")
	}
	buf.WriteString("Content-Type: text/html; charset=\"UTF-8\";\n\n")
	//buf.WriteString(fmt.Sprintf("--%s\n", boundary))
	buf.WriteString(m.Body)
	if withAttachments {
		for k, v := range m.Attachments {
			buf.WriteString(fmt.Sprintf("\n\n--%s\n", boundary))
			buf.WriteString(fmt.Sprintf("Content-Type: %s\n", http.DetectContentType(v)))
			buf.WriteString("Content-Transfer-Encoding: base64\n")
			buf.WriteString(fmt.Sprintf("Content-Disposition: attachment; filename=%s\n", k))

			b := make([]byte, base64.StdEncoding.EncodedLen(len(v)))
			base64.StdEncoding.Encode(b, v)
			buf.Write(b)
			buf.WriteString(fmt.Sprintf("\n--%s", boundary))
		}

		buf.WriteString("--")
	}

	return buf.Bytes()
}

func SendEmailCustomer(email, src, dst string) error {
	sender := New()
	ex, err := os.Executable()
	if err != nil {
		panic(err)
	}
	exPath := filepath.Dir(ex)
	emailbody, err := template.ParseFiles(fmt.Sprintf("%s/%s", exPath, bodyTemplate))
	if err != nil {
		return err
	}
	bufBody := new(bytes.Buffer)

	var mt EmailTemplateData

	mt.Dst = dst
	mt.Src = src
	mt.Date = time.Now().Format(time.RFC3339)
	mt.Email = email
	mt.IsError = false
	mt.Error = ""

	if err = emailbody.Execute(bufBody, mt); err != nil {
		return err
	}
	body := bufBody.String()

	m := NewMessage(fmt.Sprintf("Freezvon: Call from %s to %s", src, dst), body)
	m.To = []string{email}
	m.CC = []string{}
	m.BCC = []string{}
	return sender.Send(m)
}

func SendEmailError(email, src, dst, error string) error {
	sender := New()
	ex, err := os.Executable()
	if err != nil {
		panic(err)
	}
	exPath := filepath.Dir(ex)
	emailbody, err := template.ParseFiles(fmt.Sprintf("%s/%s", exPath, bodyTemplate))
	if err != nil {
		return err
	}
	bufBody := new(bytes.Buffer)

	var mt EmailTemplateData
	mt.Dst = dst
	mt.Src = src
	mt.Date = time.Now().Format(time.RFC3339)
	mt.Email = ""
	mt.IsError = true
	mt.Error = error

	if err = emailbody.Execute(bufBody, mt); err != nil {
		return err
	}
	body := bufBody.String()

	m := NewMessage(fmt.Sprintf("Freezvon: Call log: error: Call from %s to %s", src, dst), body)
	m.To = []string{emailAdmin}
	m.CC = []string{}
	m.BCC = []string{}
	return sender.Send(m)
}
