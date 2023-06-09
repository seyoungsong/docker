cd ./.docker/ros-noetic

docker compose pull

docker compose up --remove-orphans --detach
docker compose ps

docker exec -it ros bash

docker compose stop
docker compose restart

docker compose down # !WARNING! remove all containers

xhost +local:root # linux
xhost +localhost  # macos
