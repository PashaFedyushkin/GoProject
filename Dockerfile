# Build container image


FROM golang:alpine AS build
RUN apk add --no-cache git
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go build -o /go/bin/app -v ./...

# Final container image
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/app /app
ENTRYPOINT ["/go/bin/server"]
LABEL Name=Go_project Version=0.1
EXPOSE 5300
