#!/bin/bash
#
# DESCRIPTION
#   This script enables to delete all users in container to avoid delete the container e recreate it.
#   It can be useful if I need to keep students from more classes / years.

LIVEHOME=/home/giuliano/work/docker-didactics/home-students
BAKHOME=/home/giuliano/work/docker-didactics/home-students-bak
CONTAINER=rstudio_didattica

# 00. list of students to remove
declare -a Students=( "Alessandra.Apostolico" "Giuseppina.Difilippo" "Sara.Esposito" "Federico.Iannuzzi" "Valeria.Iervolino" "Vincenzo.Landolfi" "Marica.Marchese" "Gabriella.Pontillo" "Martina.Salzano" "Roberto.Tieri" "Marco.Vitillo" "Ali" "Osman.Mohamud" "Fabiana.Soprano" "Mariarosa.Astarita" "Michela.Ruberto" "Valeria.Iervolino2" )

# 01. stop docker container
echo "Stopping docker container $CONTAINER..."
docker stop $CONTAINER

# 02. backup student dir
for Student in ${Students[@]} 
 do
  if [ -d "$LIVEHOME/$Student" ]; then
    echo "sudo mv $LIVEHOME/$Student $BAKHOME/"
    sudo mv $LIVEHOME/$Student $BAKHOME/
  else
    echo "NOT FOUND: $LIVEHOME/$Student"
  fi
done  

# 03. restart docker
echo "Starting docker container $CONTAINER..."
docker start $CONTAINER

# 04. remove completely the user:
for Student in ${Students[@]}
 do
  echo "docker exec -it $CONTAINER sh -c 'userdel -r $Student'"
  docker exec -it $CONTAINER sh -c "userdel -r $Student"
done

