#!/bin/bash

container="rstudio-classroom"
#container="rstudio-docente"

# check this link to recognize usefull gdal libraries that can be installed to solve possible dependencies:
#     https://tracker.debian.org/pkg/gdal

# prepare environment, in particular for proper gdal version (see link above):
docker exec --privileged --user root -it $container  /bin/bash -c "apt-get update;apt-get -y install software-properties-common"
docker exec --privileged --user root -it $container  /bin/bash -c "add-apt-repository deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

# install required libs:
docker exec --privileged --user root -it $container  /bin/bash -c "apt-get update;apt-get -y install vim units libudunits2-dev"

# To check the version you can download without specifing a version:
# apt-cache policy gdal-bin

# install gdal (check proper version):
#docker exec --privileged --user root -it $container  /bin/bash -c "apt-get -y install gdal-bin=2.4.0+dfsg-1 libgdal-dev=2.4.0+dfsg-1 python-gdal=2.4.0+dfsg-1 python3-gdal=2.4.0+dfsg-1"
docker exec --privileged --user root -it $container  /bin/bash -c "apt-get -y install gdal-bin libgdal-dev python-gdal python3-gdal"
# manual install required gdal version, from within docker container:
# https://www.geofis.org/en/install/install-on-linux/install-gdal-from-sources/


