#!/bin/sh

# dos2unix
cp /cron*.sh /app
dos2unix /app/*

# crontab
chmod 0644 /app/crontab.sh
crontab /app/crontab.sh

# env
env >>/etc/environment

# print date
echo "Entrypoint Date: $(date)"

# run cmd (cron)
echo "$@"
exec "$@"
