docker build --tag seyoung20/cron-rclone --file .docker/Dockerfile .docker

# test
docker run -it --rm seyoung20/cron-rclone /bin/bash
