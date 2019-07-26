FROM crystallang/crystal:0.29.0 as builder
COPY . ./
RUN shards build --production --release --static

FROM alpine:3.10
COPY --from=builder /bin/bot bot
ENTRYPOINT ["/bot"]
