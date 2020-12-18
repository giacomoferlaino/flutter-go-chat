package graph

import (
	"chat/models"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

func newUserQuery(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return true, nil
		},
		Type: graphql.NewObject(
			graphql.ObjectConfig{
				Name:        "userQuery",
				Description: "User CRUD queries",
				Fields: graphql.Fields{
					"find": newFindField(db),
				},
			},
		),
	}
}

func newFindField(db *gorm.DB) *graphql.Field {
	return &graphql.Field{
		Type:        graphql.NewList(userType),
		Description: "Retrieve all users",
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			users := &[]models.User{}
			db.Find(users)
			return users, nil
		},
	}
}
