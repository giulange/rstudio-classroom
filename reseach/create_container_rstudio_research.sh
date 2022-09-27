#!/bin/bash
# This script recreate the docker container using the existent docker image,
# i.e. no new build is performed. For a new build see the script recreate_upgraded_container.sh

container=rstudio_research

# 00. remove existent container
docker container stop $container
docker container rm   $container

# 01. create container called rstudio_research
./run_research.sh $container

# 02. install dependencies required by my research targets
./install_dep.sh $container

