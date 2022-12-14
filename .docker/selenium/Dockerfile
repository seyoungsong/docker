# docker run -it --rm python:3.11-slim bash
FROM python:3.11-slim

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    chromium-l10n chromium-driver ca-certificates \
    # fonts from https://github.com/browserless/chrome/blob/master/base/Dockerfile
    fonts-ubuntu \
    fonts-noto-cjk-extra \
    fonts-noto-color-emoji \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# set display port to avoid chromium crash
ENV DISPLAY=:99
