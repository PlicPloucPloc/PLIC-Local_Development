FROM golang:1.24.0-alpine3.21

RUN apk update && apk add bash

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY *.go ./

# Build
RUN go mod init hello && go build -o /hello # TODO: Change this with the go files needed for the service

RUN adduser -D -h /home/dockeruser dockeruser
USER dockeruser

# Expose the port 80 (can be another port to acces if the compose binds it with another one)
EXPOSE 80

ENTRYPOINT ["/hello"]
