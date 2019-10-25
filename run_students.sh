# allocate docker container, having access to both media & my home:
docker run -d --name rstudio-didattica -v /home/giuliano/work/Didattica:/dati -e PASSWORD=eRtf321-a2 -p 8686:8787 rocker/tidyverse

