#!/bin/bash

users=20

for X in $(seq $users)
 do
  echo "user${X}"
  docker exec --privileged --user root -it rstudio-classroom  /bin/bash -c "/usr/sbin/adduser --disabled-password --gecos '' user${X}; echo user${X}:user${X} | chpasswd; ln -s /dati /home/user${X}/docente"
done

