#!/bin/sh

# crontab 등록
chmod 0644 /crontab.sh
dos2unix /crontab.sh
crontab /crontab.sh

# env 등록
env >>/etc/environment

# 현재 시간 프린트
echo "Entrypoint Date: $(date)"

# cron 실행
echo "$@"
exec "$@"
