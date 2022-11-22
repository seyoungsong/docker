# build
docker build --tag seyoung20/cron-rclone --file .docker/Dockerfile .docker

# test bash
docker run -it --rm seyoung20/cron-rclone /bin/bash

# test cron
docker run -it --rm seyoung20/cron-rclone

# inspect
docker inspect seyoung20/cron-rclone >temp.json

# reset docker
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune --all --force
