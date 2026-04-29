package main

import (
	"fmt"
	"os"
	"strings"
	"time"
)

func getEnv(key, defaultValue string) string {
	value := os.Getenv(key)
	if len(value) == 0 {
		return defaultValue
	}
	return value
}

func main() {
	var Account, srcNumber, dstNumber, email string
	var err error
	Account = ""
	if len(os.Args) > 1 {
		dbHost = os.Args[1]
	} else {
		dbHost = getEnv("VALIDATOR_DB_HOST", "10.10.10.205")
	}

	if len(os.Args) > 2 {
		dstNumber = os.Args[2]
		dstNumber = strings.ReplaceAll(dstNumber, "+", "")
	} else {
		fmt.Print("Don't exist dst Number")
		SentAstAudioMessage(srcNumber, "NA", time.Now().Format(time.RFC3339), Account, "NotifyClient: Don't exist dst Number")
		os.Exit(2)
	}

	if len(os.Args) > 3 {
		srcNumber = os.Args[3]
		srcNumber = strings.ReplaceAll(srcNumber, "+", "")
	} else {
		fmt.Print("Don't exist src number")
		SentAstAudioMessage("NA", "NA", time.Now().Format(time.RFC3339), Account, "NotifyClient: Don't exist src number")
		os.Exit(2)
	}

	if len(os.Args) > 4 && os.Args[4] == "dev" {
		dbHost = dbHostDev
		dbA2BHost = dbA2bHostDev
	}

	email, Account, err = GetEmailByNumber(srcNumber, dstNumber)
	if err != nil {
		SentAstAudioMessage("srcNumber", "dstNumber", time.Now().Format(time.RFC3339), Account, "NotifyClient: Email don't exist")
		os.Exit(2)
	} else {
		err := SendEmailCustomer(email, srcNumber, dstNumber)
		if err != nil {
			fmt.Printf("Cannot send email %v, err: %v", email, err.Error())
			SendEmailError(email, srcNumber, dstNumber, err.Error())
		}
	}

}
