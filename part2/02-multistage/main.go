package main

import (
	"fmt"
	"net/http"
)

func testEndpoint(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "PONG\n")
}

func actuator(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "OK\n")
}

func headers(w http.ResponseWriter, req *http.Request) {
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

func main() {
	http.HandleFunc("/test-route/headers", headers)
	http.HandleFunc("/actuator/health", actuator)
	http.HandleFunc("/ping", testEndpoint)

	http.ListenAndServe(":8080", nil)
}
