package main

import (
	"chat/apis"
	"chat/auth"
	"log"
	"net/http"

	"github.com/graphql-go/handler"
	"github.com/jinzhu/gorm"
)

type authData struct {
	Token string `json:"token"`
}

var db *gorm.DB

func init() {
	db = initDB()
}

func main() {
	defer db.Close()
	jwtManager := auth.NewJwtManager("sampleSigninKey")
	graphqlAPI := apis.NewGraphQL(db, jwtManager)
	graphqlAPI.InitSchema()
	router := http.NewServeMux()

	// router.HandleFunc("/graphql", func(res http.ResponseWriter, req *http.Request) {
	// 	query := req.URL.Query().Get("query")
	// 	result := graphqlAPI.ExecuteQuery(query)
	// 	json.NewEncoder(res).Encode(result)
	// })
	router.Handle("/graphql", handler.New(&handler.Config{
		Schema:     &graphqlAPI.Schema,
		Pretty:     true,
		GraphiQL:   true,
		Playground: true,
	}))

	log.Fatal(http.ListenAndServe(":8080", router))
}
