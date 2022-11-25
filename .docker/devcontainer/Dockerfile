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
    curl git tini unzip wget zsh && \
    rm -rf /var/lib/apt/lists/*

# pip
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    "black[jupyter]" isort jupyter pylint rope tqdm

# ohmyzsh
RUN chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc

# shellformat
RUN wget -O shfmt "https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_linux_$(dpkg --print-architecture)" && \
    chmod +x shfmt && \
    ./shfmt --version && \
    mv shfmt /usr/local/bin

# dev
RUN  && \
    # git
    git config --global user.name "seyoung" && \
    git config --global user.email "seyoung@docker" && \
    git config --global core.quotepath false && \
    git config --global pull.ff true && \
    git config --global core.autocrlf input && \
    # korean apt mirror
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list && \
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    # korean timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# apt: extra
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    # small
    apt-transport-https ca-certificates htop iputils-ping net-tools tldr tree qpdf vim \
    # large
    build-essential default-jdk ffmpeg imagemagick neofetch pandoc && \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    # tldr sync
    tldr vi > /dev/null
# TODO: latex, jekyll, chromium

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
# https://github.com/krallin/tini#existing-entrypoint
ENTRYPOINT ["tini", "--", "/usr/local/share/docker-init.sh"]
VOLUME ["/var/lib/docker"]
CMD ["sleep", "infinity"]
