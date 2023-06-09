# docker run -it --rm ubuntu:20.04 bash
FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

# pip config
ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

# korean mirror for local test
# RUN sed -i "s/archive.ubuntu.com/mirror.kakao.com/g" /etc/apt/sources.list
# RUN sed -i "s/security.ubuntu.com/mirror.kakao.com/g" /etc/apt/sources.list
# RUN printf 'deb http://mirror.kakao.com/ubuntu focal main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-updates main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-backports main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-security main restricted universe multiverse\n' > /etc/apt/sources.list

# global mirror for github actions
RUN printf 'deb http://archive.ubuntu.com/ubuntu focal main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu focal-backports main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu focal-security main restricted universe multiverse\n' > /etc/apt/sources.list

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN export DEBIAN_FRONTEND=noninteractive && \
    # update, install
    apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates \
    git \
    gnupg \
    htop \
    iputils-ping \
    locales \
    lsb-release \
    neofetch \
    openssh-server \
    ssh-import-id \
    tmux \
    tree \
    unzip \
    vim \
    wget \
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

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# https://wiki.ros.org/noetic/Installation/Ubuntu

# https://wiki.ros.org/ROS/Installation/UbuntuMirrors#Singapore
RUN sh -c 'echo "deb [trusted=yes] http://mirror-ap.packages.ros.org/ros/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -fsSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y \
    ros-noetic-desktop-full \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3-catkin-tools \
    python3-numpy \
    python3-pip \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-vcstools \
    python3-wstool \
    python3-yaml \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    catkin_pkg \
    cmake \
    cvbridge3  \
    opencv-python \
    rospkg \
    scikit-build

RUN source ~/.bashrc && \
    rosdep init && \
    rosdep update && \
    rosdep fix-permissions

# FINISH: korean mirror for local prod
RUN printf 'deb http://mirror.kakao.com/ubuntu focal main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-updates main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-backports main restricted universe multiverse\ndeb http://mirror.kakao.com/ubuntu focal-security main restricted universe multiverse\n' > /etc/apt/sources.list
