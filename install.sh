# /bin/bash
#docker pull laurentgeorge3/ros-esme:full

# installing directly on the machine

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list' 
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - 

sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full -y
