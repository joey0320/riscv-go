package main

import (
  "fmt"
  "encoding/json"
  "net/http"
)

type Bird struct {
  Species string `json:"species"`
  Description string `json:"description"`
}

var birds []Bird

func getBirdHandler(w http.ResponseWriter, r *http.Request) {
  birdListBytes, err := json.Marshal(birds)

  if err != nil {
    fmt.Println(fmt.Errorf("Error: %v" , err))
    w.WriteHeader(http.StatusInternalServerError)
    return
  }
  w.Write(birdListBytes)
}

func createBirdHandler(w http.ResponseWriter, r *http.Request) {
  bird := Bird{}

  print(r)

  err := r.ParseForm()
  if err != nil {
    fmt.Println(fmt.Errorf("Error: %v", err))
    w.WriteHeader(http.StatusInternalServerError)
    return
  }

  bird.Species = r.Form.Get("species")
  bird.Description = r.Form.Get("description")
  fmt.Printf("request species: %s, description: %s", bird.Species, bird.Description)

  birds = append(birds, bird)

  http.Redirect(w, r, "/assets/", http.StatusFound)
}
