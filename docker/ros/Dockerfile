FROM ros:kinetic

# disable installation of manpages
COPY etc/dpkg/dpkg.cfg.d/01_nodoc /etc/dpkg/dpkg.cfg.d/
# disable keeping archive in /var/cache/apt/archives
#COPY etc/apt/apt.conf.d/02nocache /etc/apt/apt.conf.d/

RUN apt-get update && apt-get install -y --no-install-recommends \
    binutils \
    ca-certificates \
    curl \
    gazebo7 \
    git \
#    libgl1-mesa-dri \
#    libsm6 \
#    menu \
#    mesa-utils \
#    net-tools \
    python-pip \
#    ros-kinetic-gazebo-msgs \
#    ros-kinetic-gazebo-plugins \
#    ros-kinetic-gazebo-ros \
#    ros-kinetic-gazebo-ros-control \
#    ros-kinetic-rqt-graph \
#    ros-kinetic-rviz \
#    ros-kinetic-turtlebot-gazebo \
#    ros-kinetic-turtlebot-teleop \
    terminator \
    vim \
    nano \
    wget \
    && apt-get clean

RUN apt-get update && apt-get install -y zsh \
        ros-kinetic-turtlesim

RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu


COPY .zshrc /etc/skel/.zshrc
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN echo "source /opt/ros/kinetic/setup.bash" >> /etc/skel/.bashrc

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD bash -c "source /opt/ros/kinetic/setup.bash; terminator"
ENV DISPLAY :2

