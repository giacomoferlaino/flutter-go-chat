package apis

import (
	"chat/apis/graph"
	"chat/auth"
	"log"

	"github.com/graphql-go/graphql"
	"github.com/jinzhu/gorm"
)

// NewGraphQL return a new GraphQL API object
func NewGraphQL(db *gorm.DB, jwtManager *auth.JwtManager) *GraphQL {

	return &GraphQL{
		DB:         db,
		jwtManager: jwtManager,
	}
}

// GraphQL is used to create a new GraphQL API object
type GraphQL struct {
	DB         *gorm.DB
	Schema     graphql.Schema
	jwtManager *auth.JwtManager
}

// InitSchema initialize the GraphQL schema needed to execute queries
func (gql *GraphQL) InitSchema() {

	graphqlSchemaConfig := graphql.SchemaConfig{
		// Mutation: ,
		Query: graph.NewQueryType(gql.DB, gql.jwtManager),
	}

	schema, err := graphql.NewSchema(graphqlSchemaConfig)
	if err != nil {
		log.Fatalf("GraphQL schema creation failed.\n Error: %v", err)
	}
	gql.Schema = schema
}
