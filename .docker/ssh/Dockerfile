# docker run -it --rm python:3.11-bullseye bash
FROM python:3.11-bullseye

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # update, install
    apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    #
    apt-transport-https \
    curl \
    git \
    htop \
    iputils-ping \
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
