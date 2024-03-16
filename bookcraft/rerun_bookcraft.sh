#!/bin/bash
# DESCRIPTION
#   This script runs a docker container dedicated to the book-crafting.
#   The idea is to create a unique docker container for all books.
#   A new book is created under the same docker container, by creating
#   a new project:
#   	new project -> new directory -> Book project using bookdown ->
#   	 > Directory name: e.g. "lectures"
#      > subdirectory of "~"
#      > html book format "bs4_book"
#
#   All the books are therefore placed together in the git repo under
#   the folder ~/git/rstudio-classroom/bookcraft. These are the source 
#   files.
#   Each time a new book project is created and you wih to publish it,
#   you have to rerun the docker container dedicated to php_apache and
#   add the new output folder e.g. "lectures/_book".
#
# REFERENCES
#   - 
#
# ISSUES
#  ...
#
# CALL
#  ./rerun_bookcraft.sh <CONTAINER_NAME> 
#  ./rerun_bookcraft.sh 
#  ./rerun_bookcraft.sh  rstudio_bookcraft
# [DEPRECATED]
#  ./rerun_bookcraft.sh <PROJECT_NAME> <CONTAINER_NAME> 


set -e # config: Exit on Error
DRYRUN=0

echo "START ==="
echo ""

# === ARGS ===
defval="rstudio_bookcraft"
CONTAINER_NAME=${1:-$defval}

if [ -z "$1" ]
  then
    #echo "No PROJECT_NAME supplied"
    echo " No CONTAINER_NAME supplied..."
    echo " ... the default label is used [$CONTAINER_NAME]"
    echo ""
    #exit
fi

# === PARAMETERS ===
#CONTAINER_NAME=rstudio_${PROJECT_NAME}
IMAGE=rocker/tidyverse:bookcraft
defUID=1000
USERNAME=giuliano
PSWD=antonietta
PORT=8487
IN_Rmd_PATH=~/git/rstudio-classroom/bookcraft
#OUT_html_PATH=~/docker-persistencies/php_apache/html
CONTAINER_HOME=/home/$USERNAME


# === START ===
#HOST_PROJ_FOLDER=${IN_Rmd_PATH}/${PROJECT_NAME}
#HOST_HTML_FOLDER=${OUT_html_PATH}/${PROJECT_NAME}
HOST_PROJ_FOLDER=${IN_Rmd_PATH}

## create directories if they do not exist!
##  -- IN directory (the one under git repo)
#if [[ ! -e $HOST_PROJ_FOLDER ]]; then
#	if [ "$DRYRUN" -eq "0" ]; then
#	  mkdir $HOST_PROJ_FOLDER
#	fi
#	echo "  Created folder $HOST_PROJ_FOLDER"
#elif [[ ! -d $HOST_PROJ_FOLDER ]]; then
#  echo "  $HOST_PROJ_FOLDER already exists but is not a directory" 1>&2
#else
#	echo "  $HOST_PROJ_FOLDER already exists"
#fi
#
#  -- OUT directory (the one under git repo)
#if [[ ! -e $HOST_HTML_FOLDER ]]; then
#	if [ "$DRYRUN" -eq "0" ]; then
#  	mkdir $HOST_HTML_FOLDER
#  fi
#  echo "  Created folder $HOST_HTML_FOLDER"
#elif [[ ! -d $HOST_HTML_FOLDER ]]; then
#  echo "  $HOST_HTML_FOLDER already exists but is not a directory" 1>&2
#else
#	echo "  $HOST_HTML_FOLDER already exists"
#fi

# Stop & Remove container:
echo ""
conid=$(docker ps -aqf "name=^${CONTAINER_NAME}$")
if [ "$conid" != "" ]; then
  echo "  Container $CONTAINER_NAME exists"
  echo "    ...stopping $CONTAINER_NAME"
  if [ "$DRYRUN" -eq "0" ]; then
  	docker container stop $CONTAINER_NAME
  fi
  echo "    ...removing $CONTAINER_NAME"
  if [ "$DRYRUN" -eq "0" ]; then
  	docker container rm   $CONTAINER_NAME
  fi
  echo "    ...done"
  echo ""
else
	echo "  Container $CONTAINER_NAME doesn't exist!"
fi

# CONTAINER CREATE:
echo ""
echo "  Creating container..."
echo ""
cat << EOF
   docker run -d 
    --name $CONTAINER_NAME 
    --restart always 
    -v ${HOST_PROJ_FOLDER}:${CONTAINER_HOME}
    -e USER=$USERNAME 
    -e USERID=$defUID -e GROUPID=$defUID -e PASSWORD=$PSWD 
    -p $PORT:8787 
    $IMAGE
EOF
#    -v ${HOST_PROJ_FOLDER}:${CONTAINER_HOME}/${PROJECT_NAME} 
#    -v ${HOST_HTML_FOLDER}:${CONTAINER_HOME}/${PROJECT_NAME}/_book 
echo ""

if [ "$DRYRUN" -eq "0" ]; then
	docker run -d \
		--name $CONTAINER_NAME \
		--restart always \
		-v ${HOST_PROJ_FOLDER}:${CONTAINER_HOME} \
		-e USER=$USERNAME \
		-e USERID=$defUID -e GROUPID=$defUID -e PASSWORD=$PSWD \
		-p $PORT:8787 \
		$IMAGE
fi
#	  -v ${HOST_PROJ_FOLDER}:${CONTAINER_HOME}/${PROJECT_NAME} \
#	  -v ${HOST_HTML_FOLDER}:${CONTAINER_HOME}/${PROJECT_NAME}/_book \

echo ""
echo "  ...done!"
echo ""

IP=$(hostname -I | cut -d' ' -f1)
echo ""
echo "----------------------------------------------------------------"
echo "goto         :  $IP:$PORT"
echo "user         :  $USERNAME"
echo "pswd         :  $PSWD"
echo "----------------------------------------------------------------"
echo "DRYRUN       :  $DRYRUN"
echo "UID          :  $defUID"
echo "GID          :  $defUID"
echo "----------------------------------------------------------------"
echo "IMAGE        :  $IMAGE"
echo "CONTAINER    :  $CONTAINER_NAME"
echo "IN  HOST     :  $HOST_PROJ_FOLDER"
#echo "OUT HOST     :  $HOST_HTML_FOLDER"
echo "IN  CONT.    :  ${CONTAINER_HOME}/"
#echo "IN  CONT.    :  ${CONTAINER_HOME}/${PROJECT_NAME}"
#echo "OUT CONT.    :  ${CONTAINER_HOME}/${PROJECT_NAME}/_book"
echo "----------------------------------------------------------------"
echo ""
echo ""
echo "END ==="
echo ""



