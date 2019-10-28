# allocate docker container, having access to both media & my home:

# - granatellu-gpu
# docker run -d --name rstudio-didattica -v /home/giuliano/work/Didattica:/dati -e PASSWORD=eRtf321-a2 -p 8686:8787 rocker/tidyverse

# VM-docker-prod
docker run -d --name rstudio-classroom -v /media/DATI/g.langella/Didattica/rstudio-students:/dati -e PASSWORD=eRtf321-a2 -p 8686:8787 rocker/tidyverse

