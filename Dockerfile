FROM jrei/crystal-alpine
COPY . .
RUN shards build --production --release --static
ENTRYPOINT ["/bin/bot"]