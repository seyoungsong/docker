#!/bin/sh

# copy new files to workdir
cp /cron* /app
dos2unix /app/*

# copy rclone config
mkdir -p /root/.config/rclone
cp /rclone.conf /root/.config/rclone/rclone.conf
chmod 0644 /root/.config/rclone/rclone.conf
dos2unix /root/.config/rclone/rclone.conf

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
