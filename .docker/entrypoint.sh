#!/bin/sh

# copy new files to workdir
cp /cron* /app
dos2unix /app/*

# crontab
chmod 0644 /app/crontab.sh
crontab /app/crontab.sh

# env
env >>/etc/environment

# print date
echo "[entrypoint] $(date)"

# run cmd (cron)
echo "[entrypoint] $@"
exec "$@"
