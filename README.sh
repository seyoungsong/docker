# build
docker build --tag seyoungsong/rclone-crontab --file .docker/Dockerfile .docker

# test bash
docker run -it --rm seyoungsong/rclone-crontab /bin/bash

# test cron
docker run -it --rm seyoungsong/rclone-crontab

# inspect
docker inspect seyoungsong/rclone-crontab >temp.json

# reset docker
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune --all --force

# https://github.com/seyoungsong/docker-rclone-crontab/actions/workflows/ci.yml
