#!/bin/bash
# This scripts add all DOCENTI listed below using the add_DOCENTE_2_rstudio.sh script.
# Please, consider to configure add_DOCENTE_2_rstudio.sh before to run THIS script.


container="rstudio-didattica-test"
PSWD="plf2020"

# ==== DOCENTI ====
# Giuliano Langella
echo "Giuliano.Langella"
./add_USER_2_rstudio.sh Giuliano.Langella antonietta $container 3002

# Domenico Vistocco
echo "Domenico.Vistocco"
./add_USER_2_rstudio.sh Domenico.Vistocco domvis2020 $container 3003
# ==== DOCENTI ====


# ==== STUDENTI ====
declare -a Students=( "Ludovica.Liguori" "Antonietta.Cameretti" "Gabriella.Orazzo" "Michela.Errico" "Francesca.Serrone" "Mariarosa.Astarita" "Roberta.Nicolosi" )
for Student in ${Students[@]} 
 do
  echo "$Student"
  ./add_USER_2_rstudio.sh $Student $PSWD $container
done
# ==== STUDENTI ====

