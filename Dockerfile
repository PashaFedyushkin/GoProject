#Final container image
FROM alpine:latest
RUN apk --no-chache-add ca-certificates
COPY --from=builder /go/bin/app /app
ENTRYPOINT ["go/bin/server"]
LABEL Name=GoProject Version=0.1
EXPOSE 5300
