#!/bin/bash
#

container=rstudio_research

# 00. remove existent container
docker container stop $container
docker container rm   $container

# 01. create container called rstudio_research
./run_research.sh

# 02. install dependencies required by my research targets
./install_dep.sh $container

