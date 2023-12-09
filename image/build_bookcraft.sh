#!/bin/bash
#
# NOTES
#  This script builds the bookcraft image from scratch.
#  It is required to create the image using this script since it is required
#  to have all the libraries and dependencies used in the didactics instances
#  to develop the content and the snippets used in the book(s). 

# === PARAMETERS ===
REF_IMAGE=rocker/tidyverse:giulange
BOOK_IMAGE=rocker/tidyverse:bookcraft
#SAV_IMAGE=rocker_tidyverse_latest
#PATH_OUT_IMAGES="~/docker-persistencies/rstudio_didattica"
#CACHE="--no-cache"
CACHE=""

# === START ===
echo "Recreating the $BOOK_IMAGE RStudio image..."

if [[ "$CACHE" != "" ]]
then
	# 00. remove local image to force --nocache (otherwise the local image is taken)
	echo "  Removing the local image $REF_IMAGE to force NO CACHE..."
	docker image rm -f $REF_IMAGE
	echo "  Removing the local image $BOOK_IMAGE to force NO CACHE..."
	docker image rm -f $BOOK_IMAGE
	echo "  ...done"
	echo ""
fi

# 01. upgrade the docker image by building it again:
# https://medium.com/@guidoman/tutorial-install-and-run-rstudio-server-with-docker-5e67607811a0
echo "  Building the (upgraded) IMAGE $REF_IMAGE..."
sh build.sh $CACHE $REF_IMAGE
echo "  ...done"
echo ""

# 02. Update the reference docker with the bookcraft requirements:
echo "Updating reference image $REF_IMAGE with bookcraft requirements..."
echo "  docker build $CACHE -t $BOOK_IMAGE -f Dockerfile_bookcraft . "
		docker build $CACHE -t $BOOK_IMAGE -f Dockerfile_bookcraft .
echo "  ...done"
echo ""

# 03. save built image for future reference
#echo "02. saving image ${BOOK_IMAGE}..."
#echo "docker save ${BOOK_IMAGE} | gzip > $PATH_OUT_IMAGES/${SAV_IMAGE}_$(date '+%Y-%m-%dT%H%M').tar.gz"
#docker save ${BOOK_IMAGE} | gzip > $PATH_OUT_IMAGES/${SAV_IMAGE}_$(date '+%Y-%m-%dT%H%M').tar.gz
#echo "...done!"
#echo ""
