docker build --tag seyoung20/cron-rclone --file .docker/Dockerfile .docker
docker build --tag seyoung20/cron-rclone --file .docker/Dockerfile .

# test
docker run -it --rm seyoung20/cron-rclone /bin/bash

# inspect
docker inspect seyoung20/cron-rclone >temp.json
