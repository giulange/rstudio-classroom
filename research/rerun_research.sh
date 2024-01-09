#!/bin/bash
# DESCRIPTION
#   This script runs a docker container dedicated to research, 
#   having access to both media & home folders of my user on 
#		host machine.
#
# REFERENCES
#   - 
#
# ISSUES
#  ...
#
# CALL
#  ./rerun_research.sh <CONTAINER_NAME>
#  ./rerun_research.sh rstudio_research

# === ARGS ===
defval="rstudio_research"
CONTAINER_NAME=${1:-$defval}

# === PARAMETERS ===
#IMAGE=rocker/tidyverse # original image name
IMAGE=rstudio_research:latest
UID=1000
USERNAME=giuliano
PSWD=antonietta
PORT_SHINY=5575

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

# -- granatellum-gpu:
echo "docker run -d --name $CONTAINER_NAME \
		   --restart always \
		   -v /media:/media \
		   -v /home/$USERNAME/tmp:/home/$USERNAME \
		   -e USER=$USERNAME \
		   -e USERID=$UID -e GROUPID=$UID -e PASSWORD=$PSWD \
		   -p 8787:8787 \
		   -p $PORT_SHINY:$PORT_SHINY \
		   $IMAGE"
#export UID=$(id -u)
#export GID=$(id -g)
docker run -d \
	--name $CONTAINER_NAME \
	--restart always \
	-v /media:/media \
	-v /home/$USERNAME:/home/$USERNAME \
	-e USER=$USERNAME \
	-e USERID=$UID -e GROUPID=$UID -e PASSWORD=$PSWD \
	-p 8787:8787 \
	-p $PORT_SHINY:$PORT_SHINY \
	$IMAGE
#		   --user $UID:$GID \
# -- VM-docker-prod:
#docker run -d --name rstudio-docente -v /media:/media -v /home/giuliano:/home/giuliano -e USER=giuliano -e USERID=1001 -e GROUPID=1001 -e PASSWORD=eRtf321-a2 -p 8787:8787 rocker/tidyverse

echo "user  :  $USERNAME"
echo "pswd  :  $PSWD"
echo ""
echo "...done!"

