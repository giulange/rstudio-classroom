#!/bin/bash
# the following code was taken from LandSupport/gci/bak_docker_containers.sh and then modified.

  container_name=rstudio_research
  PATH_OUT_IMAGES="~/saved_docker_images"

  conid=$(docker ps -aqf "name=^${container_name}$")
  if [ "$conid" != "" ]; then
    echo "container $container_name exists"

    echo "01. committing container $container_name with container-id = $conid ..."
    docker commit -p $conid ${container_name}_bak
    echo "container $container_name committed as image ${container_name}_bak"
    echo "...done!"

    echo "02. saving image ${container_name}_bak ..."
    echo "docker save ${container_name}_bak | gzip > $PATH_OUT_IMAGES/${container_name}_save_$(date '+%Y-%m-%dT%H%M').tar.gz"
    docker save ${container_name}_bak | gzip > $PATH_OUT_IMAGES/${container_name}_save_container_$(date '+%Y-%m-%dT%H%M').tar.gz
    echo "...done!"

    echo ""

  elif [ "$conid" == "" ]; then
    echo "container $container_name is not running, skipped!"
    echo ""

  fi
