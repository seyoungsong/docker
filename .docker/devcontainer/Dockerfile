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

# ohmyzsh
RUN chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc

# shellformat
RUN wget -O shfmt "https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_linux_$(dpkg --print-architecture)" && \
    chmod +x shfmt && \
    ./shfmt --version && \
    mv shfmt /usr/local/bin

# tldr
RUN mkdir -p ~/.local/share/tldr && \
    tldr --update

# TODO: latex
# apt: extra
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    # small
    apt-transport-https ca-certificates htop iputils-ping net-tools tldr tree qpdf vim \
    # large
    build-essential default-jdk ffmpeg imagemagick neofetch pandoc \
    # chromium
    chromium-l10n chromium-driver fonts-noto-cjk \
    && \
    # clean up
    rm -rf /var/lib/apt/lists/*

# jekyll
RUN apt-get update -y && \
    apt-get install -y -qq --no-install-recommends \
    ruby-full zlib1g-dev nodejs && \
    gem install jekyll bundler

# pip: extra
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
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
# https://github.com/krallin/tini#existing-entrypoint
ENTRYPOINT ["tini", "--", "/usr/local/share/docker-init.sh"]
VOLUME ["/var/lib/docker"]
CMD ["sleep", "infinity"]
