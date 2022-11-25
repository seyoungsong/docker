# docker run -it --rm python:3.11 bash
FROM python:3.11

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y ;\
    apt-get upgrade -y ;\
    apt-get install -y -qq --no-install-recommends \
    # must
    curl git tini unzip vim zsh \
    # small
    apt-transport-https ca-certificates htop iputils-ping net-tools tldr tree wget qpdf \
    # large
    build-essential default-jdk ffmpeg imagemagick neofetch pandoc

# pip
RUN pip install --no-cache-dir --upgrade pip ;\
    pip install --no-cache-dir \
    "black[jupyter]" pylint rope isort tqdm jupyter

# ohmyzsh
RUN chsh -s /bin/zsh ;\
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended ;\
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc

# docker-in-docker
# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/docker-in-docker.md#script-use
ENV DOCKER_BUILDKIT=1
# https://github.com/devcontainers/features/tree/main/src/docker-in-docker
RUN bash -c "$(curl -fsSL https://raw.github.com/devcontainers/features/main/src/docker-in-docker/install.sh)"
# https://github.com/krallin/tini#existing-entrypoint
ENTRYPOINT ["tini", "--", "/usr/local/share/docker-init.sh"]
VOLUME ["/var/lib/docker"]

# dev
RUN tldr vi > /dev/null ;\
    # git
    git config --global user.name "seyoung" ;\
    git config --global user.email "seyoung@docker" ;\
    git config --global core.quotepath false ;\
    git config --global pull.ff true ;\
    git config --global core.autocrlf input ;\
    # korean apt mirror
    cp /etc/apt/sources.list /etc/apt/sources.list.bak ;\
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list ;\
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list ;\
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list ;\
    # korean timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# zsh
CMD ["/bin/zsh"]