cd ./.docker/ros-noetic

docker compose pull

docker compose up --remove-orphans --detach &&
    docker compose logs --follow

xhost +local:root # linux
xhost +localhost  # macos
