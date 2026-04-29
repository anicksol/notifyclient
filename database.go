package main

import (
	"database/sql"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

func GetEmailByNumber(src, dst string) (string, string, error) {
	var err error = nil
	var db *gorm.DB

	connString := dbA2BUser + ":" + dbA2BPassword + "@tcp(" + dbHost + ":" + strconv.Itoa(dbA2BPort) + ")/" + dbA2BName + "?charset=utf8&parseTime=true&loc=Local"

	db, err = gorm.Open("mysql", connString)
	if err != nil {
		fmt.Println("CRITICAL", "DB", "Cannot connect to Database -= "+dbA2BName+"=-")
		os.Exit(2)
	}
	defer db.Close()

	// SetMaxIdleConns sets the maximum number of connections in the idle connection pool.
	db.DB().SetMaxIdleConns(10)

	// SetMaxOpenConns sets the maximum number of open connections to the database.
	db.DB().SetMaxOpenConns(20)

	// SetConnMaxLifetime sets the maximum amount of time a connection may be reused.
	db.DB().SetConnMaxLifetime(time.Hour)

	var iduser string
	var rowsa *sql.Rows
	rowsa, err = db.Table("cc_did").Select(" iduser ").Where(" did =  ? or did = ? ", src, dst).Limit("1").Rows()
	if err != nil {
		return "", "", err
	}
	for rowsa.Next() {
		rowsa.Scan(&iduser)
	}
	var email, username string = "", ""
	if iduser != "" {
		var rowsb *sql.Rows
		rowsb, err = db.Table("cc_card").Select(" email_notification, username ").Where(" id =  ? AND notify_email = 1 ", iduser).Limit("1").Rows()
		if err != nil {
			return "", "", err
		}
		for rowsb.Next() {
			rowsb.Scan(&email, &username)
		}
	}
	return email, username, nil
}

func SentAstAudioMessage(src, dst, date, account, msg string) error {
	var err error = nil
	var db *gorm.DB

	connString := dbUser + ":" + dbPassword + "@tcp(" + dbHost + ":" + strconv.Itoa(dbPort) + ")/" + dbName + "?charset=utf8&parseTime=true&loc=Local"

	db, err = gorm.Open("mysql", connString)
	if err != nil {
		fmt.Println("CRITICAL", "DB", "Cannot connect to Database -= "+dbName+"=-")
		os.Exit(2)
	}
	defer db.Close()

	// SetMaxIdleConns sets the maximum number of connections in the idle connection pool.
	db.DB().SetMaxIdleConns(10)

	// SetMaxOpenConns sets the maximum number of open connections to the database.
	db.DB().SetMaxOpenConns(20)

	// SetConnMaxLifetime sets the maximum amount of time a connection may be reused.
	db.DB().SetConnMaxLifetime(time.Hour)

	tx := db.Begin()

	msg = strings.ReplaceAll(msg, "'", "")

	stmt := fmt.Sprintf("INSERT INTO astaudiolog(Account, Dst, Src, Date, Message) VALUES ( '%s', '%s', '%s', '%s', '%s'); ", account, dst, src, date, msg)
	err = tx.Exec(stmt).Error
	if err != nil {
		tx.Rollback()
	}

	err = tx.Commit().Error
	if err != nil {
		return err
	}

	return nil
}
