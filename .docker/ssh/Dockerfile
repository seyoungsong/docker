# docker run -it --rm python:3.11-bullseye bash
FROM python:3.11-bullseye
# docker build --tag ssh:local .docker/ssh
# docker run -it --rm ssh:local zsh

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
    tmux \
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
    locale -a && \
    locale
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8

# etc
RUN true && \
    # omz
    chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc && \
    sed -i '1s/^/zstyle ":omz:update" mode disabled\n/' ~/.zshrc  && \
    # zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  && \
    sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" ~/.zshrc && \
    # rclone
    bash -c "$(curl -fsSL https://rclone.org/install.sh)" && \
    rclone version && \
    # taskfile | https://taskfile.dev
    sh -c "$(curl -fsSL --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin && \
    task --version
