#!/bin/sh

# print current date
echo "[cronjob] $(date)"

# run rclone
echo "[cronjob] rclone sync dropbox: /filebrowser-srv/dropbox"
rclone sync dropbox: /filebrowser-srv/dropbox --transfers 10 --progress --track-renames --track-renames-strategy modtime

# print end time
echo "[cronjob] Done. $(date)"
