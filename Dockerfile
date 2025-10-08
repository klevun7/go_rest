FROM golang:alpine

WORKDIR /go_rest
COPY go.mod go.sum ./
RUN go mod download

COPY . .


RUN go build -o ./bin/api ./cmd/api \
    && go build -o ./bin/migrate ./cmd/migrate

CMD ["/go_rest/bin/api"]
EXPOSE 8080