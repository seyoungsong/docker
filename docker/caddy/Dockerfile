# docker run -it --rm caddy:2-builder sh
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# docker run -it --rm caddy:2 sh
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN /usr/bin/caddy list-modules --skip-standard --versions && \
    echo "Done."
