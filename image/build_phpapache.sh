#!/bin/bash

# INPUT ARGUMENTS
defval="php_apache"
image=${1:-$defval}

def_cache=""
#def_cache=" --no-cache"
NO_CACHE=${2:-$def_cache}

# rename the current image:
docker tag $image ${image}_old
docker rmi $image

#build the new image:
echo "Building $image image..."
echo "  >> docker build $NO_CACHE -t $image -f php/Dockerfile ."
docker build $NO_CACHE -t $image -f php/Dockerfile .

# remove the old image
#docker rmi ${image}_old

echo "...done!"
echo ""
echo ""

