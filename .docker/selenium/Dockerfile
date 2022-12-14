# docker run -it --rm python:3.11-slim-bullseye bash
FROM python:3.11-slim-bullseye

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # add non-free to apt sources
    echo "deb http://deb.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
    # update, install
    apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    # chromium
    chromium-l10n chromium-driver ca-certificates \
    # fonts
    fonts-ubuntu \
    fonts-noto-cjk-extra \
    fonts-noto-color-emoji \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# set display port to avoid chromium crash
ENV DISPLAY=:99
