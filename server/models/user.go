package models

// User data model
type User struct {
	Model
	Username string `json:"username"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

// PasswordMatch return the string comparison between the saved password
// and the one passed as an argument
func (user *User) PasswordMatch(password string) bool {
	return user.Password == password
}
