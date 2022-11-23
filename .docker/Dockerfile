# docker run -it --rm debian:stable-slim bash
FROM debian:stable-slim

# Korean timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# apt: install cron, rclone
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update ; \
    apt-get install -y -qq --no-install-recommends \
    cron curl unzip ca-certificates dos2unix ; \
    curl https://rclone.org/install.sh | bash ; \
    rm -rf /var/lib/apt/lists/*

# copy sample files
COPY crontab.sh /crontab.sh
COPY cronjob.sh /cronjob.sh

# set entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0744 /entrypoint.sh ; \
    dos2unix /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# workdir
WORKDIR /app

# https://manpages.ubuntu.com/manpages/trusty/man8/cron.8.html
# -f | Stay in foreground mode, don't daemonize.
# -L loglevel | Tell  cron  what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
CMD ["cron", "-f", "-L", "2"]
