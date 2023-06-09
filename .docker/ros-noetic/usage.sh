cd ./.docker/ros-noetic

docker compose pull

docker compose up --remove-orphans --detach &&
    docker compose logs --follow

docker compose stop
docker compose restart

docker exec -it ros bash

xhost +local:root # linux
xhost +localhost  # macos
