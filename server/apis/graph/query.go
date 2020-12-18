package graph

import (
	"chat/auth"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

// NewQueryType returns graphql query type
func NewQueryType(db *gorm.DB, jwtManager *auth.JwtManager) *graphql.Object {
	return graphql.NewObject(
		graphql.ObjectConfig{
			Name: "Query",
			Fields: graphql.Fields{
				"auth": newAuthField(db, jwtManager),
				"user": newUserQuery(db),
			},
		},
	)
}
