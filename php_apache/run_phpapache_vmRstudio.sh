#!/bin/bash
# DESCRIPTION
#  This script runs the RStudio Server PHP container
#  on top of an image build using the Dockerfile_phpapache.
# 
# REFERENCES
#   - ...
#
# ISSUES
#  Remove dependence of DB on station mac-address,
#  which may change over time.
#
# CALL
#  ./run [<IMAGE-NAME>,<CONTAINER-NAME>,<BRIDGE-NAME>]


# ========= PARAMETERS =============
PORT_WEB=8080
PORT_SSL=443
DEF_IMAGE_NAME=php_apache_rstudio
DEF_CONTAINER_NAME=php_apache-booklets
DEF_NET_NAME=bridge
# On VM RStudio Didactics on Granatellum proxmox:
WEBAPPS=/home/giuliano/docker-persistencies/php_apache/html
BOOK1=/home/giuliano/git/rstudio-classroom/bookcraft/lectures/_book

# ========= ARGS =============
IMAGE_NAME=${1:-$DEF_IMAGE_NAME}
CONTAINER_NAME=${2:-$DEF_CONTAINER_NAME}
NET_NAME=${3:-$DEF_NET_NAME}

# ========= START =============
echo "Docker cycle is:   IMAGE(${IMAGE_NAME}) --> CONTAINER(${CONTAINER_NAME})"

# check container existence and kill it before to run again:
container_id=$(docker ps -q --filter "name=$CONTAINER_NAME$")

if [ ! -z "$container_id" ]; then
  echo "  container $CONTAINER_NAME already running..."
  echo "    stopping it.."
  docker stop $container_id
  echo "    removing it..."
  docker rm $container_id
else
  echo "  container $CONTAINER_NAME not existent..."
fi


echo "  Start container $CONTAINER_NAME running on top of $IMAGE_NAME image"
echo "      > network      : $DEF_NET_NAME"
echo "      > port http    : $PORT_WEB"
echo "      > port https   : $PORT_SSL"
echo "      > main HTML    : $WEBAPPS"
echo "      > Lectures     : $BOOK1"
echo ""
docker run \
-d \
--name $CONTAINER_NAME \
--restart always \
--network $NET_NAME \
-v $WEBAPPS:/var/www/html \
-v $BOOK1:/var/www/html/lectures \
-p $PORT_WEB:80 \
-p $PORT_SSL:443 \
-t \
$IMAGE_NAME
echo ""
echo "  ...done!"
echo ""
echo ""

