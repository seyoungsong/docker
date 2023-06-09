cd ./.docker/ros-noetic

docker compose up --remove-orphans --detach &&
    docker compose logs --follow
