#!/bin/sh

# crontab 등록
chmod 0644 /crontab.sh
crontab /crontab.sh

# cron 실행
env >>/etc/environment
echo "시작: $(date)"
echo "$@"
exec "$@"
