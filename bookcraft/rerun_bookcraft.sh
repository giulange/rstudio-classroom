#!/bin/bash
# DESCRIPTION
#   This script runs a docker container dedicated to the book-crafting.
#
# REFERENCES
#   - 
#
# ISSUES
#  ...
#
# CALL
#  ./rerun_bookcraft.sh <CONTAINER_NAME>
#  ./rerun_bookcraft.sh rstudio_bookcraft

# === ARGS ===
defval="rstudio_bookcraft"
CONTAINER_NAME=${1:-$defval}

# === PARAMETERS ===
IMAGE=rocker/tidyverse:bookcraft
UID=1000
USERNAME=giuliano
PSWD=antonietta
PORT=8487
HOST_PERSISTENCY_PATH=~/git/rstudio-classroom/bookcraft
CONTAINER_WDIR=/home/$USERNAME

# === START ===

conid=$(docker ps -aqf "name=^${CONTAINER_NAME}$")
if [ "$conid" != "" ]; then
  echo "  Container $CONTAINER_NAME exists"
  echo "    ...stopping $CONTAINER_NAME"
  docker container stop $CONTAINER_NAME
  echo "    ...removing $CONTAINER_NAME"
  docker container rm   $CONTAINER_NAME
  echo "    ...done"
  echo ""
fi

# CONTAINER CREATE:
echo "docker run -d \
			 --name $CONTAINER_NAME \
		   --restart always \
		   -v ${HOST_PERSISTENCY_PATH}:$CONTAINER_WDIR \
		   -e USER=$USERNAME \
		   -e USERID=$UID -e GROUPID=$UID -e PASSWORD=$PSWD \
		   -p $PORT:8787 \
		   $IMAGE"
#export UID=$(id -u)
#export GID=$(id -g)
docker run -d \
	--name $CONTAINER_NAME \
	--restart always \
	-v ${HOST_PERSISTENCY_PATH}:$CONTAINER_WDIR \
	-e USER=$USERNAME \
	-e USERID=$UID -e GROUPID=$UID -e PASSWORD=$PSWD \
	-p $PORT:8787 \
	$IMAGE
#		   --user $UID:$GID \
# -- VM-docker-prod:
#docker run -d --name rstudio-docente -v /media:/media -v /home/giuliano:/home/giuliano -e USER=giuliano -e USERID=1001 -e GROUPID=1001 -e PASSWORD=eRtf321-a2 -p 8787:8787 rocker/tidyverse

echo "http://localhost:$PORT"
echo "user  :  $USERNAME"
echo "pswd  :  $PSWD"
echo ""
echo "...done!"
