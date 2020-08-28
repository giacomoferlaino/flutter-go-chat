package main

import (
	"chat/models"
	"log"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
)

func initDB() *gorm.DB {
	db, err := gorm.Open("sqlite3", "./foo.db")
	if err != nil {
		log.Fatalf("Error while connecting to database.\n Error: %v", err)
		return nil
	}

	db.AutoMigrate(&models.User{})

	return db
}
