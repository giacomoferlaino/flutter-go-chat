package graph

import "github.com/graphql-go/graphql"

// sessionDataType is the SessionData model for GraphQL
var sessionDataType = graphql.NewObject(
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
