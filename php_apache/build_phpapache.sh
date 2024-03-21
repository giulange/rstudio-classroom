#!/bin/bash

# PARAMETERS
DOCKERFILE=Dockerfile_phpapache

# INPUT ARGUMENTS
defval="php_apache_rstudio"
image=${1:-$defval}

def_cache=""
#def_cache=" --no-cache"
NO_CACHE=${2:-$def_cache}

# rename the current image:
docker tag $image ${image}_old
docker rmi $image

#build the new image:
echo "Building $image image..."
echo "  >> docker build $NO_CACHE -t $image -f $DOCKERFILE ."
docker build $NO_CACHE -t $image -f $DOCKERFILE .

# remove the old image
#docker rmi ${image}_old

echo "...done!"
echo ""
echo ""

