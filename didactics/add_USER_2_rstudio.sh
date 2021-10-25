#!/bin/bash

# PARAMETERS
#  - dynamic
USER=$1
PSWD=$2
#pswd="wed-12-3-E_d-"
#  - static
CONTAINER=$3 #"rstudio-didattica"
ID=$4
TUTORNAME="TUTOR"
TUTORID=65535

# run container:
echo "Adding $USER to container $CONTAINER with password=$PSWD..."

if [ ! -z "${ID}" ]; then
docker exec --privileged --user root -it $CONTAINER  /bin/bash -c "groupadd --gid $TUTORID $TUTORNAME;/usr/sbin/adduser --uid $ID --gid $TUTORID --force-badname --disabled-password --gecos '' $USER; echo $USER:$PSWD | chpasswd;chmod -R o-xrw /home/$USER;ln -s /didattica /home/$USER/didattica"
else
docker exec --privileged --user root -it $CONTAINER  /bin/bash -c "/usr/sbin/adduser --force-badname --disabled-password --gecos '' $USER; echo $USER:$PSWD | chpasswd;chown -R $USER:$TUTORID /home/$USER;chmod -R g+w,o-xrw /home/$USER;ln -s /didattica /home/$USER/didattica"
fi

echo "...done!"
