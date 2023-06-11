# docker run -it --rm debian:stable-slim bash
FROM debian:stable-slim

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # update, install
    apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    # tools
    ca-certificates \
    curl \
    locales \
    unzip \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# locale (debian) | https://stackoverflow.com/a/38553499
RUN sed -i -e 's/# ko_KR.UTF-8 UTF-8/ko_KR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=ko_KR.UTF-8 && \
    export LANG=ko_KR.UTF-8 && \
    export LC_ALL=ko_KR.UTF-8 && \
    export LANGUAGE=ko_KR.UTF-8 && \
    locale -a && \
    locale
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8

# rclone
RUN bash -c "$(curl -fsSL https://rclone.org/install.sh)"

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# workdir
WORKDIR /app
