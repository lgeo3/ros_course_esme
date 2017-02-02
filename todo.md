 TURTLEBOT_GAZEBO_WORLD_FILE=/opt/ros/kinetic/share/turtlebot_gazebo/worlds/playground.world roslaunch turtlebot_gazebo turtlebot_world.launch --screen



roslaunch /opt/ros/kinetic/share/turtlebot_navigation/launch/includes/gmapping/gmapping.launch.xml
roslaunch turtlebot_teleop keyboard_teleop.launch 


save map: 

cd /data
rosrun map_server map_saver


rviz


dans rviz: 

ajout de map



===============

cart playground.pgm / playground.yaml  -> a utiliser pour amcl 
roslaunch turtlebot_navigation amcl_demo.launch

TURTLEBOT_MAP_FILE=/data/map.yaml roslaunch  turtlebot_navigation  amcl_demo.launch

add topic Posearray -> /particlecloud



rosservice call /global_localization "{}" 


faire un tour complet sur soit meme en envoyant une commande au robot (a l'aide d'un rostopic pub 

faire un screenshot et annoter l'image



pour les deplacements: utilisation d'un mouvement smooth (comme le code au cours du tp2 -> avec une vitesse = 0.1, et 0.1 en rotation)

plus c'est lent mieux c'est..

et surtout ne pas taper dans les murs !



Alternative: Utiliser un meilleurs capteur -> leur donner un xml avec un hokuyo (ou leur dire de le faire) ? [quel est l'interet]
ou sinon plus simple leur donner un rosbag avec un hokuyo .. (ou un hokuyo a 360 degrés ?)

leur proposer de faire un rosbag sur le robot - avec une manettes ? -> team work .. avec un rosbag a partager ? 


TODO: explication gmapping/slam en general 

puis leur donner une reference vers le papier ?




Deuxieme partie avec amcl ? Peut etre plus simple ?
