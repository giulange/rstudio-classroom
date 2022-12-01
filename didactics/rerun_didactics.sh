#!/bin/bash
#
# DESCRIPTION
#   This script runs a docker container dedicated to didactics, 
#   handling different classes in separated docker containers.
# 
# REFERENCES
#   - ...
#
# INPUTS
#  $1  :  ENV = { gevs | plf | mgs }
#           > gevs : Geografia e Valutazion del Suolo
#           > plf  : Precision Livestock Farming
#           > mgs  : master in GIS science UNIPD
#
#  $2  :  image name, e.g. rocker/tidyverse:latest
#
# CALL
#  ./rerun_didactics.sh [ <ENV> , <IMAGE-NAME> ]
#  ./rerun_didactics.sh plf rocker/tidyverse:latest


# ========= PARAMETERS =============
DEF_ENV=gevs
DEF_IMAGE_NAME=rocker/tidyverse:latest
PERSISTENCY_PATH=~/docker-persistencies/rstudio_didattica
home_teachers=${PERSISTENCY_PATH}/home-teachers

# ========= ARGS =============
ENV=${1:-$DEF_ENV}
IMAGE_NAME=${2:-$DEF_IMAGE_NAME}

# ========= START =============
CONTAINER_NAME=rstudio_didattica_${ENV}
home_students=${PERSISTENCY_PATH}/home-students-$ENV

if [ "$ENV" == "gevs" ]; then
  PORT=8787
elif [ "$ENV" == "plf" ]; then
  PORT=8686
elif [ "$ENV" == "mgs" ]; then
  PORT=8585
else
  echo "Error: argument ENV=$ENV not recognized!"
  exit 1
fi

conid=$(docker ps -aqf "name=^${CONTAINER_NAME}$")
if [ "$conid" != "" ]; then
  # Remove Container:
  echo "Stopping container $CONTAINER_NAME..."
  docker stop $container
  echo "...done!"

  echo "Removing container $CONTAINER_NAME..."
  docker rm $CONTAINER_NAME
  echo "...done!"
fi


echo "Creating container $CONTAINER_NAME..."

docker run -d \
  --restart always \
  --name $CONTAINER_NAME \
  -v ${home_teachers}:/didattica \
  -v ${home_students}:/home \
  -e PASSWORD=eRtf321-a2 \
  -p $PORT:8787 \
  $IMAGE_NAME
#   deafult user: rstudio, pswd: eRtf321-a2 -- try it at http://rstudio-classroom.ddns.net/
#  -v /home/giuliano/work/Didattica-test:/didattica \
#  -v /home/giuliano/work/Didattica-home:/home \

echo "DEFAULT user is"
echo "  rstudio"
echo "  eRtf321-a2"

echo "...done!"

