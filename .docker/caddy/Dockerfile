FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN /usr/bin/caddy list-modules --skip-standard --versions && \
    echo "Done."
