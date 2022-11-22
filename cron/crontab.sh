# At every minute.
* * * * * bash /cronjob.sh >/proc/1/fd/1 2>/proc/1/fd/2

# https://crontab.guru/
# 이 파일은 CRLF가 아닌 LF로 저장되어야 함.
# An empty line is required at the end of this file for a valid cron file.
