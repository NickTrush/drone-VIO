FROM osrf/ros:foxy-desktop 

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt $(. /etc/os-release && echo $VERSION_CODENAME) main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt $(. /etc/os-release && echo $VERSION_CODENAME)-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt $(. /etc/os-release && echo $VERSION_CODENAME)-security main restricted universe multiverse" >> /etc/apt/sources.list

# ROS Gazebo installation
RUN apt-get update \
	&& apt-get upgrade -y\
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    --no-install-recommends \
    mesa-utils \
    ros-foxy-gazebo* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
