# docker run -it --rm python:3.11 bash
FROM python:3.11

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y ;\
    apt-get upgrade -y ;\
    apt-get install -y -qq --no-install-recommends \
    apt-transport-https ca-certificates curl git iputils-ping neofetch tini tldr tree unzip vim wget zsh

# pip
RUN pip install --no-cache-dir --upgrade pip ;\
    pip install --no-cache-dir \
    black pylint rope isort

# ohmyzsh
RUN chsh -s /bin/zsh ;\
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended ;\
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' ~/.zshrc

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
ENTRYPOINT ["tini", "--"]
CMD ["/bin/zsh"]
