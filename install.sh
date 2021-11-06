# /bin/bash
#docker pull laurentgeorge3/ros-esme:full

# installing directly on the machine

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list' 
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - 

sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full -y
sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main"
sudo apt-get update
sudo apt-get install librealsense2-dkms ros-kinetic-librealsense linux-headers-generic -y
sudo apt-get install ros-kinetic-turtlebot-gazebo -y

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

