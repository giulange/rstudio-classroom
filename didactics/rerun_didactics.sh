#!/bin/bash
#
# NOTES
#   This script runs a docker container dedicated to didactics, 
#   having access to both media & my home.

container="rstudio_didattica"
image=rocker/tidyverse:latest
PERSISTENCY_PATH=~/docker-persistencies/rstudio_didattica2
home_teachers=${PERSISTENCY_PATH}/home-teachers
home_students=${PERSISTENCY_PATH}/home-students

conid=$(docker ps -aqf "name=^${container}$")
if [ "$conid" != "" ]; then
  # Remove Container:
  echo "Stopping container $container..."
  docker stop $container
  echo "...done!"

  echo "Removing container $container..."
  docker rm $container
  echo "...done!"
fi


echo "Creating container $container..."

# - granatellu-gpu
docker run -d \
  --restart always \
  --name $container \
  -v ${home_teachers}:/didattica \
  -v ${home_students}:/home \
  -e PASSWORD=eRtf321-a2 \
  -p 8686:8787 \
  $image
#   deafult user: rstudio, pswd: eRtf321-a2 -- try it at http://rstudio-classroom.ddns.net/
#  -v /home/giuliano/work/Didattica-test:/didattica \
#  -v /home/giuliano/work/Didattica-home:/home \

# VM-docker-prod
#docker run -d --name rstudio-classroom -v /media/DATI/g.langella/Didattica/rstudio-students:/dati -e PASSWORD=eRtf321-a2 -p 8686:8787 rocker/tidyverse

echo "...done!"
