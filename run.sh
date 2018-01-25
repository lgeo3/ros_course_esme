# /bin/bash
xhost local:
docker run --net host --rm -it -v `pwd`:`pwd` -w `pwd` -e LOCAL_PWD=`pwd` --privileged --env="QT_X11_NO_MITSHM=1" -e DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -e LOCAL_USER_ID=$UID laurentgeorge3/ros-esme:latest bash $*
