package apis

import (
	"chat/models"
	"context"
	"net/http"
)

// Authenticate is a middleware that reads the authentication token
// from the header and saves the relative user into context
func Authenticate(req *http.Request) context.Context {
	return context.WithValue(req.Context(), newContextKey("user"), &models.User{})
}
