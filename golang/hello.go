package main

import (
    "fmt"
    "net/http"

    "go.opentelemetry.io/otel"
)

func HelloServer(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()

    tracer := otel.Tracer("MyAPI")
    _, span := tracer.Start(ctx, "Hello")
    defer span.End()

    fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
