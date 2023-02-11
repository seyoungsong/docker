# docker run -it --rm busybox sh
FROM busybox AS builder

RUN ARCH=$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    echo "ARCH is [ ${ARCH} ]" && \
    URL="https://caddyserver.com/api/download?os=linux&arch=${ARCH}&p=github.com%2Fcaddy-dns%2Fcloudflare" && \
    echo "URL is [ ${URL} ]" && \
    wget -O /caddy "${URL}" && \
    chmod +x /caddy && \
    /caddy list-modules --skip-standard --versions && \
    echo "Done."

# docker run -it --rm caddy:2 sh
FROM caddy:2

COPY --from=builder /caddy /usr/bin/caddy
