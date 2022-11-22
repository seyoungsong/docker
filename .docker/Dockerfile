# docker run -it --rm debian:stable-slim bash
FROM debian:stable-slim

# apt 설정
ARG DEBIAN_FRONTEND=noninteractive

# cron, rclone 설치
RUN apt-get update ; \
    apt-get install -y -qq --no-install-recommends \
    cron curl unzip ca-certificates dos2unix ; \
    curl https://rclone.org/install.sh | bash ; \
    rm -rf /var/lib/apt/lists/*

# 타임존 한국
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 샘플 crontab, cronjob 복사
COPY crontab.sh /crontab.sh
COPY cronjob.sh /cronjob.sh

# add entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0744 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# https://manpages.ubuntu.com/manpages/trusty/man8/cron.8.html
# -f | Stay in foreground mode, don't daemonize.
# -L loglevel | Tell  cron  what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
CMD ["cron", "-f", "-L", "2"]
