# NOTES

## CHANGES

CREATED   08-Oct-2021
Modified  ...



## INSTRUCTIONS

image       :: rocker/tidyverse:latest
container   :: rstudio_research
container   :: rstudio_didactics

 1. `recreate_upgraded_container.sh`  --> build image + run two containers {didactics + research}
 2. `create_rstudio_research.sh`      --> run two containers assuming the image was already built
 3. `save_rstudio_research_container_as_image.sh --> save the image built to avoid recreate it in case of necessity`

To create a class see the dedicated scripts outside the docker folder.

