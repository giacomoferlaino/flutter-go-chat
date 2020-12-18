package graph

import (
	"chat/models"
	"errors"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

func newUserMutation(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return true, nil
		},
		Type: graphql.NewObject(
			graphql.ObjectConfig{
				Name:        "userMutation",
				Description: "User CRUD mutations",
				Fields: graphql.Fields{
					"create": newCreateField(db),
					"delete": newDeleteField(db),
				},
			},
		),
	}
}

func newCreateField(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Type:        userType,
		Description: "Create new user",
		Args: graphql.FieldConfigArgument{
			"username": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
			"email": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
			"password": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
		},
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			username, ok := p.Args["username"].(string)
			if !ok {
				return nil, errors.New("invalid username")
			}
			email, ok := p.Args["email"].(string)
			if !ok {
				return nil, errors.New("invalid email")
			}
			password, ok := p.Args["password"].(string)
			if !ok {
				return nil, errors.New("invalid password")
			}
			user := models.User{
				Username: username,
				Email:    email,
				Password: password,
			}
			if err := db.Create(&user).Error; err != nil {
				return nil, err
			}
			return user, nil
		},
	}
}

func newDeleteField(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Type:        userType,
		Description: "Delete user",
		Args: graphql.FieldConfigArgument{
			"id": &graphql.ArgumentConfig{
				Type: graphql.String,
			},
		},
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			id, ok := p.Args["id"].(string)
			if !ok {
				return nil, errors.New("invalid id")
			}
			user := models.User{}
			user.ID = id
			if db.First(&user).RowsAffected == 0 {
				return nil, errors.New("user not found")
			}
			if err := db.Unscoped().Delete(&user).Error; err != nil {
				return nil, err
			}
			return user, nil
		},
	}
}
