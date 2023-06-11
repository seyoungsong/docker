git clone https://github.com/seyoungsong/docker ~/seyoung-docker

cd ~/seyoung-docker/.docker/ros-noetic

docker compose pull

docker compose up --remove-orphans --detach
docker compose ps

xhost +local:root # linux
xhost +localhost  # macos

docker exec -it ros bash
# roscore
# rqt
code --folder-uri vscode-remote://attached-container+$(printf ros | xxd -p)/data

docker compose stop
docker compose restart

docker compose down # !WARNING! remove all containers
