# docker run -it --rm python:3.11-slim-bullseye bash
FROM python:3.11-slim-bullseye

# apt
ARG DEBIAN_FRONTEND=noninteractive

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# pip
ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1
RUN pip install --no-cache-dir \
    fastapi \
    "uvicorn[standard]"
