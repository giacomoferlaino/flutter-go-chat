package models

import (
	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// User data model
type User struct {
	Model
	Username string `json:"username"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

// BeforeCreate generates a new UUID before saving
func (user *User) BeforeCreate(scope *gorm.Scope) error {
	scope.SetColumn("ID", uuid.New())
	return nil
}
