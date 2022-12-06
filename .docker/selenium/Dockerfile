# docker run -it --rm python:3.11-slim bash
FROM python:3.11-slim

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    chromium-l10n chromium-driver ca-certificates \
    # fonts from https://github.com/browserless/chrome/blob/master/base/Dockerfile
    fonts-freefont-ttf \
    fonts-gfs-neohellenic \
    fonts-indic \
    fonts-ipafont-gothic \
    fonts-kacst \
    fonts-liberation \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    fonts-roboto \
    fonts-thai-tlwg \
    fonts-wqy-zenhei \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# pip
ENV PIP_ROOT_USER_ACTION=ignore
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /requirements.txt

# set display port to avoid chromium crash
ENV DISPLAY=:99

# print python version
CMD ["python", "-VV"]
