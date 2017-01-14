# Installation

1. Install Docker:

   sudo apt-get install -y docker.io 
   sudo usermod -a -G docker $(whoami)

To check docker is correctly installed:

   docker run hello-world

You should get the following screen: 

Hello from Docker!
[...]

2. Getting the course docker image

   docker pull laurentgeorge3/ros-esme


3. Running the docker image

   docker run -it --net host --privileged  laurentgeorge3/ros-esme
   
4. Connect to the notebook application

   Open the url http://localhost:8888/ into your web browser, you should get the Jupyter notebook application.

5. Connect to the vncserver

   Open the url http://localhost:5801/ and start the application with javaws

Click Always trust content from this publisher, then click RUN.
When a password is requested use the password: MYVNCPASSWORD

Open a terminal in the vncviewer window and test ros:

rostopic list

You should get the following result:

    rostopic list
    /rosout
    /rosout_agg







GAZEBO:

Simulation turtlebot:

todo utiliser le nom du package
TURTLEBOT_GAZEBO_WORLD_FILE=/opt/ros/kinetic/share/turtlebot_gazebo/worlds/corridor.world roslaunch /opt/ros/kinetic/share/turtlebot_gazebo/launch/turtlebot_world.launch 

gzclient

rviz

ajout dans rviz du pointcloud etc..


installation package teleop : ros-kinetic-turtlebot-teleop
