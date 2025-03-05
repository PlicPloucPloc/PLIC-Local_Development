FROM golang:1.24.0-alpine3.21

RUN apk update && apk add bash

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY *.go ./

# Build

RUN go mod init hello
RUN go get github.com/gofiber/fiber/v2/log && go get go.opentelemetry.io/otel && go get go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp && go get go.opentelemetry.io/otel/propagation&& go get go.opentelemetry.io/otel/sdk/resource && go get go.opentelemetry.io/otel/sdk/trace && go get go.opentelemetry.io/otel/semconv/v1.17.0
RUN go build -o /hello # TODO: Change this with the go files needed for the service


RUN adduser -D -h /home/dockeruser dockeruser
USER dockeruser

# Expose the port 80 (can be another port to acces if the compose binds it with another one)
EXPOSE 8080

ENTRYPOINT ["/hello"]
