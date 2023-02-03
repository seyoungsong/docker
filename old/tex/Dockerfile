# docker run -it --rm --init --privileged --shm-size=2gb ghcr.io/seyoungsong/devcontainer bash
FROM ghcr.io/seyoungsong/devcontainer

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN true && \
    # apt mirror: default 
    sed -i "s/ftp.kaist.ac.kr/deb.debian.org/g" /etc/apt/sources.list && \
    apt-get update -y && \
    # apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    # latex, perl
    texlive-full perl cpanminus && \
    # latexindent
    wget https://raw.github.com/cmhughes/latexindent.pl/main/helper-scripts/latexindent-module-installer.pl && \
    bash -c "echo Y | perl latexindent-module-installer.pl" && \
    rm -rf latexindent-module-installer.pl && \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    # apt mirror: korean
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list
