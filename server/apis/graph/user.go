package graph

import (
	"chat/models"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

func newUserField(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return true, nil
		},
		Type: graphql.NewObject(
			graphql.ObjectConfig{
				Name:        "userQuery",
				Description: "User CRUD",
				Fields: graphql.Fields{
					"find": &graphql.Field{
						Type:        graphql.NewList(userType),
						Description: "Retrieve all users",
						Resolve: func(p graphql.ResolveParams) (interface{}, error) {
							users := &[]models.User{}
							db.Find(users)
							return users, nil
						},
					},
				},
			},
		),
	}
}

// userType is the User model for GraphQL
var userType = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "User",
		Fields: graphql.Fields{
			"id": &graphql.Field{
				Type: graphql.String,
				Resolve: func(p graphql.ResolveParams) (interface{}, error) {
					user := p.Source.(models.User)
					return user.ID, nil
				},
			},
			"username": &graphql.Field{
				Type: graphql.String,
			},
			"email": &graphql.Field{
				Type: graphql.String,
			},
			"password": &graphql.Field{
				Type: graphql.String,
			},
		},
	},
)
