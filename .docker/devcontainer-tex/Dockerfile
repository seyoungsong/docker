# docker run -it --rm seyoungsong/devcontainer bash
FROM seyoungsong/devcontainer

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN cp /etc/apt/sources.list.bak /etc/apt/sources.list
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    # latex
    texlive-full \
    && \
    rm -rf /var/lib/apt/lists/*

# TODO: latex, perl, latexindent

# korean apt mirror
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list && \
    sed -i "s/archive.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirror.misakamikoto.network/g" /etc/apt/sources.list
