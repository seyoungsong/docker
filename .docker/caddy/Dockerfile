# docker run -it --rm caddy:2 sh
FROM caddy:2 AS builder

RUN wget -O /caddy "https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fcaddy-dns%2Fcloudflare" && \
    chmod +x /caddy && \
    /caddy list-modules

# docker run -it --rm caddy:2 sh
FROM caddy:2

COPY --from=builder /caddy /usr/bin/caddy
