# docker run -it --rm debian:bullseye bash
FROM debian:bullseye

# RUN printf "deb http://mirror.yuki.net.uk/debian bullseye main contrib non-free\ndeb http://mirror.yuki.net.uk/debian bullseye-updates main contrib non-free\ndeb http://mirror.yuki.net.uk/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list
RUN printf "deb http://deb.debian.org/debian bullseye main contrib non-free\ndeb http://deb.debian.org/debian bullseye-updates main contrib non-free\ndeb http://deb.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y \
    apt-transport-https \
    build-essential \
    curl \
    git \
    htop \
    iputils-ping \
    locales \
    neofetch \
    net-tools \
    openssh-server \
    ssh-import-id \
    sudo \
    tmux \
    tree \
    unzip \
    vim \
    wget \
    x11-apps \
    zsh \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# locale (debian) | https://stackoverflow.com/a/38553499
RUN sed -i -e 's/# ko_KR.UTF-8 UTF-8/ko_KR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8

# omz
RUN chsh -s /bin/zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc && \
    sed -i '1s/^/zstyle ":omz:update" mode disabled\n/' ~/.zshrc  && \
    # zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  && \
    sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" ~/.zshrc && \
    # rclone
    bash -c "$(curl -fsSL https://rclone.org/install.sh)" && \
    rclone --version && \
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
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list >/dev/null && \
    apt-get update && \
    apt-get install -y gh && \
    gh --version && \
    rm -rf /var/lib/apt/lists/*

# conda | https://github.com/conda-forge/miniforge/releases/latest
ARG CONDA_DIR=/opt/conda
RUN wget -O /mambaforge.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-$(uname -m).sh" && \
    bash /mambaforge.sh -b -p ${CONDA_DIR} && \
    rm /mambaforge.sh && \
    ${CONDA_DIR}/bin/mamba init bash && \
    ${CONDA_DIR}/bin/mamba init zsh

# localization: korean mirror
RUN printf "deb http://mirror.yuki.net.uk/debian bullseye main contrib non-free\ndeb http://mirror.yuki.net.uk/debian bullseye-updates main contrib non-free\ndeb http://mirror.yuki.net.uk/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list && \
    # korean timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# change default shell
SHELL ["/bin/zsh", "-c"]
