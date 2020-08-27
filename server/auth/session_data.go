package auth

// SessionData contains the information needed to send authenticated requests
type SessionData struct {
	Token     string `json:"token"`
	ExpiresIn uint64 `json:"expiresIn"`
}
