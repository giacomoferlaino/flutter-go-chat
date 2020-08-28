package apis

import (
	"chat/auth"
	"chat/models"
	"errors"
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
	queryType := graphql.NewObject(
		graphql.ObjectConfig{
			Name: "Query",
			Fields: graphql.Fields{
				"auth": &graphql.Field{
					Type:        models.SessionDataType,
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
						gql.DB.Where(&models.User{Email: email}).First(user)
						if !user.PasswordMatch(password) {
							return nil, errors.New("invalid credentials")
						}
						authToken, err := gql.jwtManager.CreateToken(user.ID)
						if err != nil {
							return nil, errors.New("error generating authentication token")
						}
						return models.SessionData{
							Token: authToken,
						}, nil
					},
				},
			},
		},
	)

	graphqlSchemaConfig := graphql.SchemaConfig{
		// Mutation: ,
		Query: queryType,
	}

	schema, err := graphql.NewSchema(graphqlSchemaConfig)
	if err != nil {
		log.Fatalf("GraphQL schema creation failed.\n Error: %v", err)
	}
	gql.Schema = schema
}

// // ExecuteQuery executes a GraphQL query and returns the result
// func (gql *GraphQL) ExecuteQuery(query string) *graphql.Result {
// 	result := graphql.Do(graphql.Params{
// 		Schema:        gql.schema,
// 		RequestString: query,
// 	})
// 	if len(result.Errors) > 0 {
// 		fmt.Printf("errors: %v", result.Errors)
// 	}
// 	return result
// }
