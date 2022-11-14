#!/bin/bash
# DESCRIPTION
#  This script update the docker container user/group IDs with the ones 
#  of the host machine user. For instance, on Pedometrics VM on 
#  granatellum-gpu physical machine via proxmox, I have giuliano user
#  with IDs 1002:1002, while the IDs available in the container were
#  3002:3002 given by giuliano user on grana-gpu-VM (old granatellum-gpu).
#
#  Before to run this script it is advisable to prepare a backup copy
#  of the target docker image to modify.
# 
# REFERENCES
#   - https://faun.pub/set-current-host-user-for-docker-container-4e521cef9ffc
#
# ISSUES
#  ...
#
# CALL
#  ./build_uid.sh <CACHE> <IMAGE>
#  ./build_uid.sh --no-cache rstudio_research

# === ARGS ===
defval=" " # " --no-cache"
CACHE=${1:-$defval}

defval=rstudio_research:latest
IMAGE=${2:-$defval}
#IMAGE=rocker/tidyverse:latest

# === PARAMETERS ===
UID=1002
GID=1002

# === START ===
# Update the docker image:
echo "Updating docker container user IDs in image $IMAGE..."
echo "  docker build $CACHE -t $IMAGE -f Dockerfile_uid . "
docker build $CACHE -t $IMAGE -f Dockerfile_uid .
echo "  ...done"
echo ""
