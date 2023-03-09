#!/bin/bash
#
# DESCRIPTION
#   This script build the image and then 
#   runs the container passed as input.
# 
# REFERENCES
#   - ...
#
# INPUTS
#  $1  :  ENV = { gevs | plf | mgs }
#  [mandatory]
#           > gevs : Geografia e Valutazion del Suolo
#           > plf  : Precision Livestock Farming
#           > mgs  : master in GIS science UNIPD
#
#  $2  :  image name, e.g. rocker/tidyverse:latest
#  [optional]
#
# CALL
#  ./deploy_didactics.sh [ <ENV> , <IMAGE-NAME> ]
#  ./deploy_didactics.sh plf rocker/tidyverse:latest


# ========= PARAMETERS =============
DEF_IMAGE_NAME=rocker/tidyverse:latest

# ========= ARGS =============
ENV=$1
IMAGE_NAME=${2:-$DEF_IMAGE_NAME}

# ========= START =============
CONTAINER_NAME=rstudio_didattica_${ENV}
PERSISTENCY_PATH=~/docker-persistencies/rstudio_didattica/home-students-$ENV

# check number of input arguments:
if [ $# -eq 0 ]
  then
  	echo "Wrong arguments."
  	echo ""
  	echo "CALL:"
  	echo "  ./deploy_didactics.sh [ <ENV> , <IMAGE-NAME> ]"
fi

# check argument #1
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

# BUILD
CURRENT_DIR=$PWD
cd ~/git/rstudio-classroom/image

# 00. remove local image to force --nocache (otherwise the local image is taken)
echo "  Removing the local image $IMAGE_NAME to force NO CACHE..."
docker image rm -f $IMAGE_NAME
echo "  ...done"
echo ""

# 01. upgrade the docker image by building it again:
# https://medium.com/@guidoman/tutorial-install-and-run-rstudio-server-with-docker-5e67607811a0
echo "  Building the (upgraded) IMAGE $IMAGE_NAME..."
sh build.sh "" "$IMAGE_NAME"
echo "  ...done"
echo ""

# RUN
cd $CURRENT_DIR

# create home dir for students if not existent yet:
if [ -d "$PERSISTENCY_PATH" ];
then
  echo "  Home dir already exists:"
  echo "    > $PERSISTENCY_PATH"
else
  echo "  Creating home dir:"
  echo "    > $PERSISTENCY_PATH"
  mkdir $PERSISTENCY_PATH
fi
echo ""

# 02. run container
./rerun_didactics.sh $ENV $IMAGE_NAME

