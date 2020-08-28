package models

import (
	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// Message data model
type Message struct {
	Model
}

// BeforeCreate generates a new UUID before saving
func (message *Message) BeforeCreate(scope *gorm.Scope) error {
	scope.SetColumn("ID", uuid.New())
	return nil
}
