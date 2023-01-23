// Source code from https://github.com/sohamkamani/blog_example__go_web_app

package main

import (
  "fmt"
  "os"
  "errors"
  "net/http"
  "github.com/gorilla/mux"
)

func newRouter() *mux.Router {
  print("Building a new router\n")
  r := mux.NewRouter()
  r.HandleFunc("/hello", handler).Methods("GET")

  staticFileDirectory := http.Dir("./assets/")
  staticFileHandler := http.StripPrefix("/assets/", http.FileServer(staticFileDirectory))
  r.PathPrefix("/assets/").Handler(staticFileHandler).Methods("GET")

  r.HandleFunc("/bird", getBirdHandler).Methods("GET")
  r.HandleFunc("/bird", createBirdHandler).Methods("POST")
  return r
}

func main() {
  r := newRouter()
  err := http.ListenAndServe(":8080", r)
  if errors.Is(err, http.ErrServerClosed) {
    fmt.Printf("server closed\n")
  } else if err != nil {
    fmt.Printf("error starting server: %s\n", err)
    os.Exit(1)
  }
}

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello World")
}
