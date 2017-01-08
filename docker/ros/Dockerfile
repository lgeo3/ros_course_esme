FROM ros:kinetic  # <-- probleme pas de rviz etc dans cette image
# apt-get install ros-desktop-full  pour avoir tout ça a tester ?

RUN apt-get update ; apt-get install -yq --no-install-recommends \ 
    wget
RUN wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
RUN bash Anaconda2-4.2.0-Linux-x86_64.sh -f -b
RUN ~/anaconda2/bin/pip install rospkg
RUN ~/anaconda2/bin/pip install catkin_pkg

CMD [ "roscore"]


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
