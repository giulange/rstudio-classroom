#!/bin/bash

# PARAMETERS
#  - dynamic
USER=$1
PSWD=$2
#pswd="wed-12-3-E_d-"
#  - static
CONTAINER=$3 #"rstudio-didattica"

# run container:
echo "Adding $USER to container $CONTAINER with password=$PSWD..."
docker exec --privileged --user root -it $CONTAINER  /bin/bash -c "/usr/sbin/adduser --force-badname --disabled-password --gecos '' $USER; echo $USER:$PSWD | chpasswd;ln -s /dati /home/$USER/dati"
echo "...done!"

