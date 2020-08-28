package models

import "github.com/graphql-go/graphql"

// SessionDataType is the SessionData model for GraphQL
var SessionDataType = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "SessionData",
		Fields: graphql.Fields{
			"token": &graphql.Field{
				Type: graphql.String,
			},
			"expiresIn": &graphql.Field{
				Type: graphql.Int,
			},
		},
	},
)
