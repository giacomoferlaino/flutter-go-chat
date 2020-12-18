package graph

import (
	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

// NewMutationType returns graphql mutation type
func NewMutationType(db *gorm.DB) *graphql.Object {
	return graphql.NewObject(
		graphql.ObjectConfig{
			Name: "Mutation",
			Fields: graphql.Fields{
				"user": newUserMutation(db),
			},
		},
	)
}
