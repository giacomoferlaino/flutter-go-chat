package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type authData struct {
	Token string `json:"token"`
}

func main() {
	router := http.NewServeMux()

	router.HandleFunc("/auth/login", func(res http.ResponseWriter, req *http.Request) {
		response := authData{Token: "authToken"}
		apiResponse, err := json.Marshal(response)
		if err != nil {
			fmt.Fprintln(res, "An error occured")
			return
		}
		fmt.Fprint(res, string(apiResponse))
	})

	log.Fatal(http.ListenAndServe(":8080", router))
}