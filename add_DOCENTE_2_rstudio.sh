#!/bin/bash

# PARAMETERS
#  - dynamic
Docente=$1
pswd=$2
#pswd="wed-12-3-E_d-"
#  - static
container="rstudio-didattica"

# run container:
docker exec --privileged --user root -it $container  /bin/bash -c "/usr/sbin/adduser --force-badname --disabled-password --gecos '' $Docente; echo $Docente:$pswd | chpasswd;ln -s /dati /home/$Docente/dati"

