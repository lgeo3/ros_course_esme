title: BE python for robotics
author: Laurent George
categories: course
created: 15/11/2023



# Part 1 

1. What is a ros publisher ? Provide an example of a publisher.


2. What is a ros subscriber ? Provide an example of a subscriber


3. List 3 ros message types, and describes their usages/context.



# Part 2


In this exercice you have to code a simple obstacle avoidance system for the turtlebot. Here is a video of the expected result: https://youtu.be/nsdixTXz4V0


## Step 1


Launch the turtle bot in the Gazebo Simulator 

```
    export TURTLEBOT3_MODEL=burger
    ros2 launch turtlebot3_gazebo empty_world.launch.py 
```

Add some walls using the building editor (Menu->Edit->building editor). Don't forget to save your world.
Take a screenshot.


### List the ros topics used by the robots


The simulated robot is publishing messages on different ros topics. Your task is to list them and provide a short description of each topic and message on it.


### Visualize the published messages in rviz


RVIZ allows to graphically visualize the different messages published, run RVIZ and set the current coordinate system to 

```sh
     ros2 run rviz2 rviz2
```

Take a nice screenshot of your visualization.



### Send motion command to the robot


- What are the topics the robot is listening to ?
- Published the correct message to move the robot (using the command line) 
- What is the message you used, on which topic, what is the effect ?



# Step 2



### /scan topic

We are going to use the /scan topic and associated messages to check for obstacles around the robot. Please provide a detailled description of your undestanding of /scan topic, check how it works by adding obstacle in front of the robot and checking the result in rviz. Please provide screenshot of what your test and detailled explanation.


### Strategy to avoid obstacles


Describe the steps that you want to follow in order to achieve the obstacle avoidance behavior. Write them in pseudolanguage or using a state machine diagramm.


#### Write and test the code to avoid obstacles


You could use numpy function like: 
np.roll, np.array, np.nanmin etc.


Please makes a video/recording of your robot evolving in the world (you can use the video recording button on the top right side of gazebo to record a .mp4 video, to copy file from the vm to your computer you can use ssh).


