FROM jrei/crystal-alpine
COPY . .
RUN apk --update add ca-certificates && \
  shards build --production --release --static

FROM alpine
COPY --from=0 /etc/ssl/certs /etc/ssl/certs
COPY --from=0 /bin/bot /
ENTRYPOINT ["/bot"]
