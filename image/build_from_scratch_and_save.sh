#!/bin/bash
#
# NOTES
#  This script builds the rstudio-server image from scratch.
#  The build.sh script also install the required dependencies and
#  the required packages. 
#  The image is then committed and finally saved on HDD as backup.
#
#  Once the whole procedure in this script is done, the image is ready 
#  to produce the two (or more) containers required.
#
# INPUTS:
#  $1 : Do you want to save image?

echo ""
echo "========= START ==========="

# === ARGS ===
defval=0
SAVE_IMAGE=${1:-$defval}

# === PARAMETERS ===
IMAGE=rocker/tidyverse:latest
SAV_IMAGE=rocker_tidyverse_latest
PATH_OUT_IMAGES="~/docker-persistencies/rstudio_didattica"

# === START ===
echo "Recreating the $IMAGE RStudio image..."

# 00. remove local image to force --nocache (otherwise the local image is taken)
echo "  Removing the local image $IMAGE to force NO CACHE..."
docker image rm -f $IMAGE
echo "  ...done"
echo ""

# 01. upgrade the docker image by building it again:
# https://medium.com/@guidoman/tutorial-install-and-run-rstudio-server-with-docker-5e67607811a0
echo "  Building the (upgraded) IMAGE $IMAGE..."
sh build.sh --no-cache $IMAGE
echo "  ...done"
echo ""

# 02. save built image for future reference
if [ "$SAVE_IMAGE" -eq "1" ]; then
	echo "02. saving image ${IMAGE}..."
	echo "docker save ${IMAGE} | gzip > $PATH_OUT_IMAGES/${SAV_IMAGE}_$(date '+%Y-%m-%dT%H%M').tar.gz"
	docker save ${IMAGE} | gzip > $PATH_OUT_IMAGES/${SAV_IMAGE}_$(date '+%Y-%m-%dT%H%M').tar.gz
	echo "...done!"
	echo ""
fi

echo ""
echo "========== END ============"
echo ""
echo ""