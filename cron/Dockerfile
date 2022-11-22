# docker run -it --rm debian:stable-slim bash
FROM debian:stable-slim

# apt 설정
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i "s/deb.debian.org/ftp.kaist.ac.kr/g" /etc/apt/sources.list

# cron, rclone 설치
RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends cron curl unzip ca-certificates && \
    curl https://rclone.org/install.sh | bash

# 타임존 한국
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 샘플 crontab, cronjob 복사
COPY crontab.sh /crontab.sh
COPY cronjob.sh /cronjob.sh

# rclone.conf 복사
COPY rclone.conf /root/.config/rclone/rclone.conf
RUN chmod 0644 /root/.config/rclone/rclone.conf

# entrypoint 등록
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0744 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# cron 포그라운드 실행
CMD ["cron", "-f", "-L", "2"]
