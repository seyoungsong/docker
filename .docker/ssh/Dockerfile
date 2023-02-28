# docker run -it --rm python:3.11-bullseye bash
# docker build --tag ssh:local .docker/ssh
FROM python:3.11-bullseye

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # update, install
    apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    curl \
    git \
    htop \
    iputils-ping \
    locales \
    neofetch \
    openssh-server \
    ssh-import-id \
    tree \
    unzip \
    vim \
    wget \
    zsh \
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
    locale
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8
