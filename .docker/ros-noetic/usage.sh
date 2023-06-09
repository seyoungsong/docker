docker build --tag ros:local --file ./.local/ros/Dockerfile ./.local/ros

docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    osrf/ros:noetic-desktop-full

xhost +local:root

docker run --rm -it \
    -v ~/docker-ros/catkin_ws:/root/catkin_ws \
    -v ~/.ssh:/root/.ssh \
    --network host \
    --env ROS_MASTER_URI=http://localhost:11311 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --env="QT_X11_NO_MITSHM=1" \
    docker-ros_ros \
    bash

docker run \
    --name ros1 \
    -it \
    --privileged \
    --env="DISPLAY=:0.0" \
    -v=/tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v=/dev:/dev \
    -v= <Host_ws >: <Container_ws > \
    -w= <Work_dir > \
    osrf/ros:melodic-desktop-full

docker run -it \
    --privileged \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /etc/localtime:/etc/localtime:ro \
    -e TZ=Asia/Seoul \
    -v /dev:/dev \
    -w /root \
    osrf/ros:melodic-desktop-full
