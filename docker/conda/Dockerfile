# docker run -it --rm debian:11 bash
FROM debian:11

# pip
ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1
RUN pip install poetry

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
    net-tools \
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
    task --version && \
    # ssh-import-id
    ssh-import-id-gh seyoungsong && \
    cat ~/.ssh/authorized_keys && \
    # sshd_config
    sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config && \
    sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config && \
    service ssh restart && \
    # git
    git config --global user.name "docker" && \
    git config --global user.email "docker@docker" && \
    git config --global core.quotepath false && \
    git config --global pull.ff true && \
    git config --global core.autocrlf input && \
    # gh | https://github.com/cli/cli/releases/latest
    ARCH=$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    echo "ARCH: ${ARCH}" && \
    URL="https://github.com/cli/cli/releases/download/v2.23.0/gh_2.23.0_linux_${ARCH}.deb" && \
    echo "URL: ${URL}" && \
    wget -O /gh.deb "${URL}" && \
    dpkg -i /gh.deb && \
    rm /gh.deb

# localization: korea
RUN true && \
    # apt
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list && \
    apt-get update && \
    # timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
