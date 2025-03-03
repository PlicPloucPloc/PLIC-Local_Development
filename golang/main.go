package main

import (
    "context"
    "net/http"
    "github.com/gofiber/fiber/v2/log"
)

func main() {
    tp,err := initTracer()
    if err != nil {log.Fatal("Something went wrong")}
    defer func () {
        _ = tp.Shutdown(context.Background())
    }()
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}
