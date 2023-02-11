# build
docker build --tag selenium:local --file .docker/selenium/Dockerfile .docker/selenium

# pull
docker pull seyoungsong/rclone

# test bash
docker run -it --rm seyoungsong/rclone /bin/bash
docker run -it --rm seyoungsong/caddy sh

# test CMD
docker run -it --rm seyoungsong/rclone

# inspect
docker inspect seyoungsong/rclone >temp.json

# reset docker
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune --all --force
docker volume prune --force
