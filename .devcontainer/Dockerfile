# https://code.visualstudio.com/docs/devcontainers/tips-and-tricks

# docker run -it --rm ghcr.io/seyoungsong/python-chromium bash
FROM ghcr.io/seyoungsong/python-chromium:dev

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
