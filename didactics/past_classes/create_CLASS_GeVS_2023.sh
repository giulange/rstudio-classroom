#!/bin/bash
# This scripts add all DOCENTI listed below using the add_DOCENTE_2_rstudio.sh script.
# Please, consider to configure add_DOCENTE_2_rstudio.sh before to run THIS script.


container="rstudio_didattica_gevs"
PSWD="gevs2023"

# ==== DOCENTI ====
# Giuliano Langella
#echo "Giuliano.Langella"
#./add_USER_2_rstudio.sh Giuliano.Langella antonietta $container 3002
# ==== DOCENTI ====


# ==== STUDENTI ====
declare -a Students=( 
Riccardo.Fornaro
GiuseppePio.Alaia
Veronica.Basile
Matteo.Perrone
Antonio.Iorio
Venanzio.Ambrosino
Roberta.Ascolese
Flavia.Chianese
)

for Student in ${Students[@]} 
 do
  echo "$Student"
  ./add_USER_2_rstudio.sh $Student $PSWD $container
done
# ==== STUDENTI ====
