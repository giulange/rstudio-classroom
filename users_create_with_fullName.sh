#!/bin/bash

container="rstudio-didattica"

declare -a Students=( "Student.A" "Student.B" "Student.C" )

for Student in ${Students[@]} 
 do
  echo "$Student"
  docker exec --privileged --user root -it $container  /bin/bash -c "/usr/sbin/adduser --force-badname --disabled-password --gecos '' $Student; echo $Student:$Student | chpasswd; ln -s /dati /home/$Student/dati"
done

