# Setup

## Install Docker:

    sudo apt-get install -y docker.io
    sudo usermod -a -G docker $(whoami)

Run the hello-world docker image in order to check that docker is well installed:

    docker run hello-world

You should see an hello message from docker

```
Hello from Docker!
[...]
```

## Getting the course docker image

   docker pull laurentgeorge3/ros-esme


## Running the docker image

    mkdir -p ros-esme-ws/data
    cd ros-esme-ws
    docker run -it --net host --privileged  -v data:/data  --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" laurentgeorge3/ros-esme


If you have an nvidia graphic card use nvidia-docker (run nvidia-docker-plugin, then nvidia-docker run [...])
   
## Connect to the notebook application

   Open the url http://localhost:8888/ into your web browser, you should get the Jupyter notebook application.

## Test ros is running

In the xterm window use the following command to check ros is running

    rostopic list

You should get the following result:

    rostopic list
    /rosout
    /rosout_agg


# ROS introduction using turtle-sim


# Controlling a turtle-bot in gazebo simulation

Start gazebo simulation with a turtlebot robot

    roslaunch turtlebot_gazebo turtlebot_world.launch &
    gzclient &
    rviz
    
roslaunch turtlebot_teleop keyboard_teleop.launch

In rviz you can visualize all the sensors (3D camera, 2D camera, etc), the robot. 

Using only odometry !

Using the navigation stack:

the robot can get lost.. in this case.. 

To move the robot you can publish message on 

installation package teleop : ros-kinetic-turtlebot-teleop

faire ça pour ne pas avoir de souci avec amcl
http://answers.ros.org/question/249568/no-such-file-or-directory-gmappinglaunchxml-or-amcllaunchxml-under-turtlebot_navigationlaunchincludes/



Montrer la partie construction de carte  ?
Peut être utiliser un autre robot que le turtlebot ? Un truc avec un laser ? 


