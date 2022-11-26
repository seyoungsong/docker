# docker run -it --rm python:3.11 bash
FROM python:3.11

# docker-in-docker
# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
ENV DOCKER_BUILDKIT=1
RUN bash -c "$(curl -fsSL https://raw.github.com/devcontainers/features/main/src/docker-in-docker/install.sh)"

# apt: essential
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    curl git tini tldr unzip wget zsh && \
    rm -rf /var/lib/apt/lists/*

# pip: essential
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    "black[jupyter]" isort jupyter pylint rope

# other: essential
RUN true && \
    # ohmyzsh
    chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc && \
    # shellformat
    wget -O shfmt "https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_linux_$(dpkg --print-architecture)" && \
    chmod +x shfmt && \
    ./shfmt --version && \
    mv shfmt /usr/local/bin && \
    # caddy
    wget -O caddy.deb "https://github.com/caddyserver/caddy/releases/download/v2.6.2/caddy_2.6.2_linux_$(dpkg --print-architecture).deb" && \
    dpkg -i caddy.deb && \
    rm -rf caddy.deb && \
    # rclone
    bash -c "$(curl -fsSL https://rclone.org/install.sh)" && \
    # tldr
    mkdir -p ~/.local/share/tldr && \
    tldr --update

# apt: extra
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    # system
    apt-transport-https ca-certificates fuse \
    # util
    htop less tree vim neofetch \
    # network
    net-tools iputils-ping \
    # pdf
    qpdf pdftk-java enscript ghostscript \
    # markdown
    pandoc \
    # media
    ffmpeg imagemagick \
    # chromium
    chromium-l10n chromium-driver fonts-noto-cjk \
    # dev
    build-essential default-jdk \
    # ruby
    ruby-full zlib1g-dev nodejs \
    && \
    # clean up
    rm -rf /var/lib/apt/lists/*

# pip: extra
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    # selenium
    beautifulsoup4 python-dateutil pytz selenium

# personal config
RUN true && \
    # git
    git config --global user.name "seyoung" && \
    git config --global user.email "seyoung@devcontainer" && \
    git config --global core.autocrlf input && \
    git config --global core.quotepath false && \
    git config --global pull.ff true && \
    # korean apt mirror
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list && \
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    # korean timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
ENTRYPOINT ["/usr/local/share/docker-init.sh"]
VOLUME ["/var/lib/docker"]
CMD ["sleep", "infinity"]
