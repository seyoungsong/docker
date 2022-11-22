#!/bin/sh
# docker exec -it cron bash

# 현재 시간 프린트
echo "[cronjob] $(date)"

# rclone 테스트
echo "[cronjob] rclone --version"
rclone --version
