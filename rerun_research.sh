#!/bin/bash
#
# NOTES
#   This script runs a docker container dedicated to research, 
#   having access to both media & my home.

defval="rstudio_research"
CONTAINER_NAME=${1:-$defval}

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
docker run -d --name $CONTAINER_NAME \
		   -v /media:/media \
		   -v /home/giuliano:/home/giuliano \
		   -e USER=giuliano \
		   -e USERID=3002 -e GROUPID=3002 -e PASSWORD=eRtf321-a2 \
		   -p 8787:8787 \
		   rocker/tidyverse

# -- VM-docker-prod:
#docker run -d --name rstudio-docente -v /media:/media -v /home/giuliano:/home/giuliano -e USER=giuliano -e USERID=1001 -e GROUPID=1001 -e PASSWORD=eRtf321-a2 -p 8787:8787 rocker/tidyverse
