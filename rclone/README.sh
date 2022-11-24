# build
docker build --tag ghcr.io/seyoungsong/rclone --file .docker/Dockerfile .docker

# test bash
docker run -it --rm ghcr.io/seyoungsong/rclone /bin/bash

# test cron
docker run -it --rm ghcr.io/seyoungsong/rclone

# inspect
docker pull ghcr.io/seyoungsong/rclone
docker inspect ghcr.io/seyoungsong/rclone >temp.json

# reset docker
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune --all --force
