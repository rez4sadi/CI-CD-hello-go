FROM golang:alpine as builder

WORKDIR /go/src/app
COPY main.go .
RUN go mod init
RUN go build -o webserver .

FROM alpine
WORKDIR /app
COPY --from=builder /go/src/app/ /app
CMD ["./webserver"]

