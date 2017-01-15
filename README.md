# Setup
## Clone this repository

    git clone https://github.com/laurent-george/ros_course_esme.git

## Get the docker image

### Install Docker:

    sudo apt-get install -y docker.io
    sudo usermod -a -G docker $(whoami)

Run the hello-world docker image in order to check that docker is well installed:

    docker run hello-world

You should see an hello message from docker

```
Hello from Docker!
[...]
```

### Running the course docker container


    docker pull laurentgeorge3/ros-esme
    xhost local:
    cd ros_course_esme
    docker run -it -e LOCAL_USER_ID=`id -u $USER` --name ros-esme --net host --privileged -v `pwd`/ros-esme-ws/data:/data --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" laurentgeorge3/ros-esme


Note that if you ever exit the container, you can return to it using:

    docker start -ai ros-esme

If you have an nvidia graphic card use [nvidia-docker](https://github.com/NVIDIA/nvidia-docker): run nvidia-docker-plugin, then nvidia-docker run [...].
   

### Connect to the notebook application

   Open the url [http://localhost:8888/](http://localhost:8888/) into your web browser to access the notebooks.


# Assignment 1:

Open the iPython notebook for this assignment ([data/1_notebook.ipynb](./tp_1.ipynb)), and follow the instructions to implement and run each indicated step. 

