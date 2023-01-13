FROM golang:1.20rc2-alpine3.17 AS temp
WORKDIR /go/src
COPY . /go/src
ENV GO111MODULE=on
ENV GOPROXY="https://goproxy.io"
#RUN cd /go/src
RUN go mod download
RUN go build -o main
CMD ["/go/src/main"]

FROM alpine:3.16.3
WORKDIR /app
COPY --from=temp /go/src/main /app/app
EXPOSE 8080
ENTRYPOINT ["./app"]