#!/bin/bash
# This scripts add all DOCENTI listed below using the add_DOCENTE_2_rstudio.sh script.
# Please, consider to configure add_DOCENTE_2_rstudio.sh before to run THIS script.


container="rstudio_didattica"
PSWD="masterSPR_"

# ==== DOCENTI ====
# Giuliano Langella
#echo "Giuliano.Langella"
#./add_USER_2_rstudio.sh Giuliano.Langella antonietta $container 3002

# Domenico Vistocco
#echo "Domenico.Vistocco"
#./add_USER_2_rstudio.sh Domenico.Vistocco domvis2020 $container 3003
# ==== DOCENTI ====


# ==== STUDENTI ====
declare -a Students=( 
'agostino.mattia'
'alberti.simona'
'angioletti.andrea'
'ballerini.claudio'
'barbanti.nicolo'
'biancardi.rebeca'
'bonazzi.federico'
'bordon.chiara'
'bresciani.ilenia'
'carpenito.stefano'
'carrea.alessio'
'centamore.elisa'
'contardo.tania'
'correa.da.mota.thaina'
'crecco.lorenzo'
'dagata.alessia'
'della.longa.giulia'
'facciolo.marco'
'fare.stefano'
'galvanin.diletta'
'govi.david'
'gregori.filippo'
'maestrini.federica'
'martucci.marco'
'meloni.alessandro'
'mora.leonardo'
'morassutti.vitale.giacomo'
'ottoboni.mara'
'palmieri.lola'
'pedrolini.giulia.maria'
'piergiovanni.vincenzo'
'procaccini.danilo'
'romano.chiara'
'saporiti.giulia'
'sarzotti.ettore'
'scisci.federica'
'tha.cristina'
'todeschi.valeria'
'toma.luca'
'zappulla.marco'
)

#i=0
for Student in ${Students[@]} 
 do
  #((i=i+1))
  #echo "USER: $Student , PSWD: ${PSWD}$i"
  echo "USER: $Student , PSWD: ${PSWD}"
  ./add_USER_2_rstudio.sh $Student $PSWD $container
done
# ==== STUDENTI ====


