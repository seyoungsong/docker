# docker run -it --rm python:3.9-slim bash
FROM python:3.9-slim

# korean timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y ; \
    apt-get upgrade -y ; \
    apt-get install -y -qq --no-install-recommends \
    # chromium
    chromium-l10n chromium-driver \
    # fonts
    fonts-noto-cjk fonts-noto-mono fonts-noto-color-emoji \
    # etc
    ca-certificates python3-lxml ; \
    # cleanup
    rm -rf /var/lib/apt/lists/*

# pip
RUN pip install --no-cache-dir --upgrade pip ; \
    pip install --no-cache-dir \
    beautifulsoup4 python-dateutil pytz selenium

# chromium: set display port to avoid crash
ENV DISPLAY=:99

# print python version
CMD ["python", "-VV"]