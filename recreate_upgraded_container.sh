#!/bin/bash

container=rstudio_research

# 01. upgrade the docker image
sh build.sh

# 02. remove existent container
docker container stop $container
docker container rm   $container

# 03. create container called rstudio_research
./run_research.sh $container

# 04. install dependencies required by my research targets
./install_dep.sh $container

# 05 install R packages
# ...
