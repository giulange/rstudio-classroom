#!/bin/bash
# This scripts add all DOCENTI listed below using the add_DOCENTE_2_rstudio.sh script.
# Please, consider to configure add_DOCENTE_2_rstudio.sh before to run THIS script.


container="rstudio-didattica"
PSWD="gevs2021"

# ==== DOCENTI ====
# Giuliano Langella | already existent
echo "Giuliano.Langella"
./add_USER_2_rstudio.sh Giuliano.Langella antonietta $container
# ==== DOCENTI ====

# ==== STUDENTI ====
declare -a Students=( "Enrica.Pinelli" "Fabiana.Soprano" "Aurora.Borriello" "Venanzio.Ambrosino" "Michela.Ruberto" "Giorgio.Dantonio" "Sabrina.Marsala" "Gaspare.Abate" "Simone.Spina" "Leandro.Buongiovanni" "Vittorio.Iervolino" "Mario.Tatone" ) 

for Student in ${Students[@]} 
 do
  echo "$Student"
  ./add_USER_2_rstudio.sh $Student $PSWD $container
done
# ==== STUDENTI ====

