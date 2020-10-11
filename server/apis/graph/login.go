package graph

import (
	"chat/auth"
	"chat/models"
	"errors"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

func newAuthField(db *gorm.DB, jwtManager *auth.JwtManager) *graphql.Field {
	return &graphql.Field{
		Type: graphql.NewObject(graphql.ObjectConfig{
			Name:        "AuthQuery",
			Description: "Authenticatio queries",
			Fields: graphql.Fields{
				"login": newLoginField(db, jwtManager),
			},
		}),
	}
}

func newLoginField(db *gorm.DB, jwtManager *auth.JwtManager) *graphql.Field {
	return &graphql.Field{
		Type:        sessionDataType,
		Description: "Authentication using email and password",
		Args: graphql.FieldConfigArgument{
			"email": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
			"password": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
		},
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			email, ok := p.Args["email"].(string)
			if !ok {
				return nil, errors.New("invalid email")
			}
			password, ok := p.Args["password"].(string)
			if !ok {
				return nil, errors.New("invalid password")
			}
			user := &models.User{}
			db.Where(&models.User{Email: email}).First(user)
			if !user.PasswordMatch(password) {
				return nil, errors.New("invalid credentials")
			}
			authToken, err := jwtManager.CreateToken(user.ID)
			if err != nil {
				return nil, errors.New("error generating authentication token")
			}
			return models.SessionData{
				Token: authToken,
			}, nil
		},
	}
}
