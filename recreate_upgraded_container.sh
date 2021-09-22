#!/bin/bash

container=rstudio_research
IMAGE=rocker/tidyverse:latest

echo "Recreating the $container RStudio for research purposes..."

# 00. remove local image to force --nocache (otherwise the local image is taken)
echo "  Removing the local image to force NO CACHE..."
docker image rm -f $IMAGE
echo "  ...done"
echo ""

# 01. upgrade the docker image
echo "  Building the new IMAGE..."
sh build.sh --no-cache $IMAGE
echo "  ...done"
echo ""

# 02. remove existent container
echo "  Removing the CURRENT container..."
echo "    ...stopping $container"
docker container stop $container
echo "    ...removing $container"
docker container rm   $container
echo "  ...done"
echo ""

# 03. create container called rstudio_research
echo "  Run the NEW container..."
./run_research.sh $container
echo "...done"
echo ""
#
echo "  Enter the NEW container:"
echo "    docker exec -it -u giuliano $container /bin/bash"

# 04. install dependencies required by my research targets
#   THIS IS ALREADY PERFORMED IN THE DOCKERFILE
#echo "  Install OS dependencies in new container..."
#./install_dep.sh $container
#echo "...done"
#echo ""

# 05 install R packages
#   THIS IS ALREADY PERFORMED IN THE DOCKERFILE
# ...
#docker exec --privileged \
#            --user root \
#            -it $container \
#            /bin/bash -c "Rscript /home/giuliano/git/rstudio-server/install_packages_research.R"
