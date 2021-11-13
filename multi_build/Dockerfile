FROM golang:1.17 as builder

ENV CGO_ENABLED=0
ENV GOOS=linux

WORKDIR /go-build
COPY ./app/main.go .
RUN go build -o app main.go


FROM alpine:latest
COPY --from=builder /go-build/app /goServer
CMD ["/goServer"]