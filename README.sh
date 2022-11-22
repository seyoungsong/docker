# build
docker build --tag seyoung20/cron-rclone --file .docker/Dockerfile .docker

# test bash
docker run -it --rm seyoung20/cron-rclone /bin/bash

# test cron
docker run -it --rm seyoung20/cron-rclone

# inspect
docker inspect seyoung20/cron-rclone >temp.json
