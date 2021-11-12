FROM golang:1.17

RUN apt-get update && apt-get install git

WORKDIR /go/src/app