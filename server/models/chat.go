package models

import (
	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// Chat data model
type Chat struct {
	Model
}

// BeforeCreate generates a new UUID before saving
func (chat *Chat) BeforeCreate(scope *gorm.Scope) error {
	scope.SetColumn("ID", uuid.New())
	return nil
}
