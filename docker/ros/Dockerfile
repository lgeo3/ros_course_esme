FROM ros:kinetic
# apt-get install ros-desktop-full  pour avoir tout ça a tester ?
ENV DEBIAN_FRONTEND noninteractive    # export DEBIAN_FRONTEND="noninteractive"
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

RUN apt-get update ; apt-get install -yq --no-install-recommends \ 
    wget \ 
    ros-kinetic-rviz \
    mesa-utils \
    libsm6 \
    xauth \
    binutils \
    xserver-xorg-input-void \
    x11-xserver-utils \
    openbox \
    libgl1-mesa-dri \
    binutils \
    tint2 \ 
    xinit \
    xserver-xorg-video-dummy \ 
    websockify \
    x-window-system

# apt for thewtex opengl
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git \
  libgl1-mesa-dri \
  menu \
  net-tools \
  openbox \
  python-pip \
  sudo \
  supervisor \
  tint2 \
  x11-xserver-utils \
  x11vnc \
  xinit \
  xserver-xorg-video-dummy \
  xserver-xorg-input-void \
  websockify && \
  rm -f /usr/share/applications/x11vnc.desktop && \
  pip install supervisor-stdout && \
  apt-get -y clean

#apt-get install gazebo7 ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-control ros-kinetic-gazebo-plugins ros-kinetic-gazebo-msgs ros-kinetic-turtlebot-gazebo 



RUN wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
RUN bash Anaconda2-4.2.0-Linux-x86_64.sh -f -b
RUN ~/anaconda2/bin/pip install rospkg
RUN ~/anaconda2/bin/pip install catkin_pkg
RUN bash -c "wget -O turbovnc.deb 'http://downloads.sourceforge.net/project/turbovnc/2.1/turbovnc_2.1_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fturbovnc%2Ffiles%2F2.1%2F&ts=1484049712&use_mirror=netcologne'; dpkg -i turbovnc.deb"
RUN bash -c "wget -O turbojpeg.deb 'http://downloads.sourceforge.net/project/libjpeg-turbo/1.5.1/libjpeg-turbo-official_1.5.1_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flibjpeg-turbo%2Ffiles%2F1.5.1%2F&ts=1484049518&use_mirror=netix'; dpkg -i turbojpeg.deb"
RUN bash -c "mkdir ~/.vnc ; echo MYVNCPASSWORD | /opt/TurboVNC/bin/vncpasswd -f > ~/.vnc/passwd; chmod 700 ~/.vnc/passwd"
#CMD bash -c "/opt/TurboVNC/bin/vncserver ; ~/anaconda2/bin/jupyter-notebook & roscore"
ENV DISPLAY :2

CMD bash -c "QT_X11_NO_MITSHM=1 xinit -- :0 -nolisten tcp vt$XDG_VTNR -noreset +extension GLX +extension RANDR +extension RENDER +extension XFIXES & x11vnc -display :0 -forever -shared -nopw "

##USER root
##
### SCIENTIFIC PACKAGES
##
### R pre-requisites
##RUN apt-get update && \
##    apt-get install -y --no-install-recommends \
##    fonts-dejavu \
##    gfortran \
##    gcc && apt-get clean && \
##    rm -rf /var/lib/apt/lists/*
##
### Julia dependencies
##RUN echo "deb http://ppa.launchpad.net/staticfloat/juliareleases/ubuntu trusty main" > /etc/apt/sources.list.d/julia.list && \
##    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3D3D3ACC && \
##    apt-get update && \
##    apt-get install -y --no-install-recommends \
##    julia \
##    libnettle4 && apt-get clean && \
##    rm -rf /var/lib/apt/lists/*
##
##USER $NB_USER
##
### R packages including IRKernel which gets installed globally.
### Pin r-base to a specific build number for https://github.com/jupyter/docker-stacks/issues/210#issuecomment-246081809
##RUN conda config --add channels r && \
##    conda install --quiet --yes \
##    'rpy2=2.8*' \
##    'r-base=3.3.1 1' \
##    'r-irkernel=0.7*' \
##    'r-plyr=1.8*' \
##    'r-devtools=1.11*' \
##    'r-dplyr=0.4*' \
##    'r-ggplot2=2.1*' \
##    'r-tidyr=0.5*' \
##    'r-shiny=0.13*' \
##    'r-rmarkdown=0.9*' \
##    'r-forecast=7.1*' \
##    'r-stringr=1.0*' \
##    'r-rsqlite=1.0*' \
##    'r-reshape2=1.4*' \
##    'r-nycflights13=0.2*' \
##    'r-caret=6.0*' \
##    'r-rcurl=1.95*' \
##    'r-randomforest=4.6*' && conda clean -tipsy
##
##
### place here your application's setup specifics
##CMD [ "roslaunch", "my-ros-app my-ros-app.launch" ]
