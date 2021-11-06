#!/usr/bin/env bash


sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update

sudo apt install ros-melodic-ros-base
sudo apt install ros-melodic-turtlesim


sudo apt install openssh-server -y
sudo apt install zsh curl git
sudo chsh -s $(which zsh) $(whoami)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
source ~/.zshrc
