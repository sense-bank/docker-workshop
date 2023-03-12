FROM golang:1.8.5
WORKDIR /go/src/app
COPY . .
RUN go get -d -v .
RUN export GOPATH=/go
RUN CGO_ENABLED=0 GOOS=linux go build -o app -a -installsuffix cgo
ENTRYPOINT ["/go/src/app/app"]