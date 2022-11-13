#!/bin/bash
# DESCRIPTION
#  This script fetch the image stored in docker hub
# 
# REFERENCES
#   - https://hub.docker.com/repository/docker/giulange/pedometrics
#
# ISSUES
#  ...
#
# CALL
#  ./fetch.sh

IMAGE_HUB=giulange/pedometrics:rstudio-research-run1
IMAGE_EXE=rstudio_research

echo ""
echo "========= START ==========="

echo ""
echo "pull $IMAGE_HUB"
docker pull $IMAGE_HUB

echo ""
echo "docker tag $IMAGE_HUB $IMAGE_EXE"
docker tag $IMAGE_HUB $IMAGE_EXE

echo ""
echo "docker image rm $IMAGE_HUB"
docker image rm $IMAGE_HUB

echo ""
echo "========== END ============"
echo ""
echo ""