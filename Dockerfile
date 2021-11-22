FROM alpine:latest
RUN apk --no-chache-add ca-certificates
COPY --from=builder /go/bin/app /app
ENTRYPOINT /app
LABEL Name=GoProject Version=1
EXPOSE 5300
