#!/bin/sh

# print current date
echo "[cronjob] $(date)"

# test rclone
echo "[cronjob] rclone version"
rclone version
