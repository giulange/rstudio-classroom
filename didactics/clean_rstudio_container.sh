#!/bin/bash
#
# DESCRIPTION
#   This script enables to delete all users in container 
#   to avoid delete the container and recreate it.
#   It can be useful if I need to keep students 
#   from more classes / years.
#
# INPUTS
#  $1  :  ENV = { gevs | plf | mgs }
#           > gevs : Geografia e Valutazion del Suolo
#           > plf  : Precision Livestock Farming
#           > mgs  : master in GIS science UNIPD
#
# CALL
#  ./clean_rstudio_container.sh [ <ENV> ]
#  ./clean_rstudio_container.sh plf

# ========= PARAMETERS =============
DRYRUN=0
PERSISTENCY_PATH=~/docker-persistencies/rstudio_didattica
home_teachers=${PERSISTENCY_PATH}/home-teachers

# ========= ARGS =============
ENV=$1

# ========= ARGS CHECK =============
if [ "$ENV" == "gevs" ]; then
  echo "container  : GeVS"
elif [ "$ENV" == "plf" ]; then
  echo "container  : PLF"
elif [ "$ENV" == "mgs" ]; then
  echo "container  : MGS"
else
  echo "Error: argument ENV=$ENV not recognized!"
  exit 1
fi
echo ""

# ========= START =============
LIVEHOME=${PERSISTENCY_PATH}/home-students-$ENV/
BAKHOME=${PERSISTENCY_PATH}/home-students-bak
CONTAINER=rstudio_didattica_$ENV
declare -a EXCEPTIONS=("Giuliano.Langella" "rstudio")

# 00. list of students to remove
#declare -a Students=( "Alessandra.Apostolico" "Giuseppina.Difilippo" "Sara.Esposito" "Federico.Iannuzzi" "Valeria.Iervolino" "Vincenzo.Landolfi" "Marica.Marchese" "Gabriella.Pontillo" "Martina.Salzano" "Roberto.Tieri" "Marco.Vitillo" "Ali" "Osman.Mohamud" "Fabiana.Soprano" "Mariarosa.Astarita" "Michela.Ruberto" "Valeria.Iervolino2" )
declare -a Students=$(ls -d ${LIVEHOME}/*)
#declare -a Students=( "/home/giuliano/work/docker-didactics/home-students/Giuliano.Langella" )

for Student in ${Students[@]}
 do
  excFound=false
  if [ -d "$Student" ]; then
    fname=$(basename $Student)
    #echo $fname
    for exception in ${EXCEPTIONS[@]} 
     do
      if [[ "$fname" == "$exception" ]]; then
        excFound=true
        continue
      fi
    done
    if $excFound ; then
      echo "Skip       : $fname"
    else
      echo "Remove     : $fname"
    fi
  fi
done

echo ""
read -p "Removing useless users... Are you sure? (y | n)  :" -n 1 -r
echo ""
echo ""
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "...exiting!"
    exit
fi

# 01. stop docker container
echo "Stopping docker container $CONTAINER..."
if [ $DRYRUN -eq 0 ]; then
  docker stop $CONTAINER
fi

# 02. backup student dir
for Student in ${Students[@]} 
 do
  excFound=false
  #if [ -d "$LIVEHOME/$Student" ]; then
  if [ -d "$Student" ]; then
    fname=$(basename $Student)
    #echo $fname

    for exception in ${EXCEPTIONS[@]} 
     do
      if [[ "$fname" == "$exception" ]]; then
        echo "  User $fname skipped..."
        excFound=true
        break
      fi
    done
    if $excFound ; then
      continue
    fi

    #echo "sudo mv $LIVEHOME/$Student $BAKHOME/"
    echo "  sudo mv -f $Student $BAKHOME/"
    if [ $DRYRUN -eq 0 ]; then
      sudo rm -rf $BAKHOME/$fname
      sudo mv -f $Student $BAKHOME/
      #sudo mv $LIVEHOME/$Student $BAKHOME/
    fi
  else
    #echo "NOT FOUND: $LIVEHOME/$Student"
    echo "  NOT FOUND: $Student"
  fi
done  

# 03. restart docker
echo "  Starting docker container $CONTAINER..."
if [ $DRYRUN -eq 0 ]; then
  docker start $CONTAINER
fi

# 04. remove completely the user:
for Student in ${Students[@]}
 do
  if [ -d "$Student" ]; then
    fname=$(basename $Student)
    if [[ "$fname" == "$EXCEPTIONS" ]]; then
      echo "  User $fname skipped..."
      continue
    fi
    echo "  docker exec -it $CONTAINER sh -c 'userdel -r $fname'"
    if [ $DRYRUN -eq 0 ]; then
      docker exec -it $CONTAINER sh -c "userdel -r $Student"
    fi
  fi
done
