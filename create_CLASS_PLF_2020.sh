#!/bin/bash
# This scripts add all DOCENTI listed below using the add_DOCENTE_2_rstudio.sh script.
# Please, consider to configure add_DOCENTE_2_rstudio.sh before to run THIS script.


container="rstudio-didattica"

declare -a Students=( "Ludovica.Liguori" "Antonietta.Cameretti" "Gabriella.Orazzo" "Michela.Errico" "Francesca.Serrone" "Mariarosa.Astarita" "Roberta.Nicolosi" )
PSWD="plf2020"

# ==== DOCENTI ====
# Giuliano Langella
#./add_USER_2_rstudio.sh Giuliano.Langella antonietta $container

# Domenico Vistocco
#./add_USER_2_rstudio.sh Domenico.Vistocco domvis2020 $container
# ==== DOCENTI ====


# ==== STUDENTI ====
for Student in ${Students[@]} 
 do
  #echo "$Student"
  ./add_USER_2_rstudio.sh $Student $PSWD $container
done
# ==== STUDENTI ====

