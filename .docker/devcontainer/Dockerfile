# docker run -it --rm python:3.11-bullseye bash
FROM python:3.11-bullseye

# docker-in-docker
# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
ENV DOCKER_BUILDKIT=1
RUN bash -c "$(curl -fsSL https://raw.github.com/devcontainers/features/main/src/docker-in-docker/install.sh)"

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # non-free
    echo "deb http://deb.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update -y && \
    # apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    apt-transport-https ca-certificates curl git tldr unzip wget zsh && \
    rm -rf /var/lib/apt/lists/*

# pip
RUN pip install --no-cache-dir \
    black \
    isort \
    pylint \
    rope

# other: essential
RUN true && \
    # ohmyzsh | https://github.com/ohmyzsh/ohmyzsh#basic-installation
    chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc && \
    # shellformat | https://github.com/mvdan/sh/releases
    wget -O shfmt "https://github.com/mvdan/sh/releases/download/v3.6.0/shfmt_v3.6.0_linux_$(dpkg --print-architecture)" && \
    chmod +x shfmt && \
    ./shfmt --version && \
    mv shfmt /usr/local/bin && \
    # caddy | https://github.com/caddyserver/caddy/releases
    wget -O caddy.deb "https://github.com/caddyserver/caddy/releases/download/v2.6.2/caddy_2.6.2_linux_$(dpkg --print-architecture).deb" && \
    dpkg -i caddy.deb && \
    rm -rf caddy.deb && \
    # rclone | https://rclone.org/downloads
    bash -c "$(curl -fsSL https://rclone.org/install.sh)" && \
    # taskfile | https://taskfile.dev/installation/#install-script
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin && \
    # tldr
    mkdir -p ~/.local/share/tldr && \
    tldr --update

# apt: extra
RUN apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    # util
    htop less tree vim neofetch fuse \
    # network
    net-tools iputils-ping \
    # pdf
    pandoc qpdf \
    # chromium
    chromium-l10n chromium-driver \
    # fonts
    fonts-ubuntu \
    fonts-noto-cjk-extra \
    fonts-noto-color-emoji \
    && \
    # clean up
    rm -rf /var/lib/apt/lists/*

# personal config
RUN true && \
    # git
    git config --global user.name "seyoung" && \
    git config --global user.email "seyoung@devcontainer" && \
    git config --global core.autocrlf input && \
    git config --global core.quotepath false && \
    git config --global pull.ff true && \
    # apt mirror
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list && \
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    # timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
ENTRYPOINT ["/usr/local/share/docker-init.sh"]
VOLUME ["/var/lib/docker"]
CMD ["sleep", "infinity"]
