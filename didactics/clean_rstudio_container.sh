#!/bin/bash
#
# DESCRIPTION
#   This script enables to delete all users in container to avoid delete the container e recreate it.
#   It can be useful if I need to keep students from more classes / years.

DRYRUN=0

LIVEHOME=/home/giuliano/work/docker-didactics/home-students
BAKHOME=/home/giuliano/work/docker-didactics/home-students-bak
CONTAINER=rstudio_didattica
EXCEPTIONS="Giuliano.Langella"

# 00. list of students to remove
#declare -a Students=( "Alessandra.Apostolico" "Giuseppina.Difilippo" "Sara.Esposito" "Federico.Iannuzzi" "Valeria.Iervolino" "Vincenzo.Landolfi" "Marica.Marchese" "Gabriella.Pontillo" "Martina.Salzano" "Roberto.Tieri" "Marco.Vitillo" "Ali" "Osman.Mohamud" "Fabiana.Soprano" "Mariarosa.Astarita" "Michela.Ruberto" "Valeria.Iervolino2" )
declare -a Students=$(ls -d ${LIVEHOME}/*)
#declare -a Students=( "/home/giuliano/work/docker-didactics/home-students/Giuliano.Langella" )

# 01. stop docker container
echo "Stopping docker container $CONTAINER..."
if [ $DRYRUN -eq 0 ]; then
  docker stop $CONTAINER
fi

# 02. backup student dir
for Student in ${Students[@]} 
 do
  #if [ -d "$LIVEHOME/$Student" ]; then
  if [ -d "$Student" ]; then
    fname=$(basename $Student)
    #echo $fname
    if [[ "$fname" == "$EXCEPTIONS" ]]; then
      echo "User $fname skipped..."
      continue
    fi
    #echo "sudo mv $LIVEHOME/$Student $BAKHOME/"
    echo "sudo mv $Student $BAKHOME/"
    if [ $DRYRUN -eq 0 ]; then
      sudo mv $Student $BAKHOME/
      #sudo mv $LIVEHOME/$Student $BAKHOME/
    fi
  else
    #echo "NOT FOUND: $LIVEHOME/$Student"
    echo "NOT FOUND: $Student"
  fi
done  

# 03. restart docker
echo "Starting docker container $CONTAINER..."
if [ $DRYRUN -eq 0 ]; then
  docker start $CONTAINER
fi

# 04. remove completely the user:
for Student in ${Students[@]}
 do
  if [ -d "$Student" ]; then
    fname=$(basename $Student)
    if [[ "$fname" == "$EXCEPTIONS" ]]; then
      echo "User $fname skipped..."
      continue
    fi
    echo "docker exec -it $CONTAINER sh -c 'userdel -r $fname'"
    if [ $DRYRUN -eq 0 ]; then
      docker exec -it $CONTAINER sh -c "userdel -r $Student"
    fi
  fi
done
