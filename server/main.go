package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

func main() {
	router := http.NewServeMux()

	router.HandleFunc("/auth/login", func(res http.ResponseWriter, req *http.Request) {
		response := struct {
			Token string
		}{
			Token: "authToken",
		}
		apiResponse, err := json.Marshal(response)
		if err != nil {
			fmt.Fprintln(res, "An error occured")
			return
		}
		fmt.Fprint(res, string(apiResponse))
	})

	log.Fatal(http.ListenAndServe(":8080", router))
}
