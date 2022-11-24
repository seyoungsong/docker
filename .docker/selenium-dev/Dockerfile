# https://code.visualstudio.com/docs/devcontainers/tips-and-tricks

# docker run -it --rm ghcr.io/seyoungsong/python-chromium bash
# docker run -it --rm python:slim bash
FROM python:3.9-slim

# korean timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y ; \
    apt-get upgrade -y ; \
    apt-get install -y -qq --no-install-recommends \
    # dev tools
    apt-transport-https curl git iputils-ping neofetch tini tldr tree unzip vim wget zsh \
    # chromium
    chromium-l10n chromium-driver \
    # fonts
    fonts-noto-cjk-extra fonts-noto-mono fonts-noto-color-emoji \
    # etc
    ca-certificates python3-lxml ; \
    # cleanup
    rm -rf /var/lib/apt/lists/*

# dev: ohmyzsh
RUN chsh -s /bin/zsh ; \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended ; \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc

# dev: git
RUN git config --global core.quotepath false ; \
    git config --global pull.ff true ; \
    git config --global core.autocrlf input

# dev: tldr
RUN tldr vi > /dev/null

# pip
RUN pip install --no-cache-dir --upgrade pip ; \
    pip install --no-cache-dir \
    # dev: pip
    black pylint rope isort \
    beautifulsoup4 python-dateutil pytz selenium

# chromium: set display port to avoid crash
# ENV DISPLAY=host.docker.internal:0
ENV DISPLAY=:99

# mkdir
RUN mkdir -p /data ; \
    mkdir -p /app

# app dir
WORKDIR /app

# apt korean mirror
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak ; \
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list ; \
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list ; \
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

# git
RUN git config --global user.name "seyoung" ; \
    git config --global user.email "seyoung@docker"

# dev: zsh
# https://github.com/conda-forge/miniforge-images/blob/master/ubuntu/Dockerfile#L40
ENTRYPOINT ["tini", "--"]
CMD ["/bin/zsh"]
