FROM rocker/tidyverse:latest

RUN apt-get -y update

RUN apt-get -y install software-properties-common

RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

RUN apt-get -y install vim units libudunits2-dev

RUN apt-get -y install gdal-bin libgdal-dev python3-gdal libgsl-dev

#--- KERAS ---
RUN apt -y install python3-pip python3-venv
#RUN apt -y install build-essential python-dev

#--- R PACKAGES ---
#  - you need to install dependencies first:
RUN R -e "install.packages('devtools',clean = TRUE)"
#RUN R -e "install.packages('sp', clean = TRUE)"
#RUN R -e "install.packages('rgdal', clean = TRUE)"
#RUN R -e "install.packages('rgeos', clean = TRUE)"
#RUN R -e "install.packages('tmap', clean = TRUE)"
#RUN R -e "install.packages('reshape', clean = TRUE)"
#RUN R -e "install.packages('lattice', clean = TRUE)"
#RUN R -e "install.packages('stringr', clean = TRUE)"     # str_remove
RUN R -e "install.packages(c('sp','rgdal','rgeos','tmap','reshape','lattice','stringr'),clean=TRUE,dependencies=TRUE)"
#RUN R -e "install.packages('plyr', clean = TRUE)"
#RUN R -e "install.packages('plotrix', clean = TRUE)"
#RUN R -e "install.packages('ggplot2', clean = TRUE)"
#RUN R -e "install.packages('corrplot', clean = TRUE)"
#  - required packages for didactics:
#RUN R -e "install.packages('sf', clean = TRUE)"
#RUN R -e "install.packages('raster', clean = TRUE)"
#RUN R -e "install.packages('gstat', clean = TRUE)"
#RUN R -e "install.packages('osmdata', clean = TRUE)"
#RUN R -e "install.packages('ows4R', clean = TRUE)"
RUN R -e "install.packages(c('plyr','plotrix','ggplot2','corrplot','sf','raster','gstat','osmdata','ows4R'),clean=TRUE,dependencies=TRUE)"

#  - installed from github:
RUN R -e "devtools::install_github('IVFL-BOKU/sentinel2')"
RUN R -e "devtools::install_github('giulange/cubeR')"

#  - required for didactics by Domenico Vistocco:
#RUN R -e "install.packages('janitor', clean = TRUE)"
#RUN R -e "install.packages('infer', clean = TRUE)"
#RUN R -e "install.packages('gtools', clean = TRUE)"
#RUN R -e "install.packages('tidymodels', clean = TRUE)"
#RUN R -e "install.packages('ggthemes', clean = TRUE)"
#RUN R -e "install.packages('ggsci', clean = TRUE)"
#RUN R -e "install.packages('kable', clean = TRUE)"
#RUN R -e "install.packages('kableExtra', clean = TRUE)"
#RUN R -e "install.packages('gt', clean = TRUE)"
#RUN R -e "install.packages('DT', clean = TRUE)"
#RUN R -e "install.packages('FactoMineR', clean = TRUE)"
#RUN R -e "install.packages('factoextra', clean = TRUE)"
#RUN R -e "install.packages('skimr', clean = TRUE)"
#RUN R -e "install.packages('ggridges', clean = TRUE)"
#RUN R -e "install.packages('ggeconodist', repos = 'https://cinc.rud.is', clean = TRUE)"
#RUN R -e "install.packages('corrr', dep = TRUE)"
RUN R -e "install.packages(c('janitor','infer','gtools','tidymodels','ggthemes','ggsci','kable','kableExtra','gt','DT','FactoMineR','factoextra','skimr','ggridges','ggeconodist','corrr'),clean=TRUE,dependencies=TRUE)"
RUN R -e "devtools::install_github('thomasp85/patchwork')"

#  - required packages for research
#RUN R -e "install.packages('RcppGSL',dependencies=TRUE, clean=TRUE)"
#RUN R -e "install.packages('Rfast',dependencies=TRUE, clean=TRUE)"
#RUN R -e "install.packages('sharpshootR', dependencies=TRUE, clean = TRUE)" # plotSoilRelationGraph
#RUN R -e "install.packages('binaryLogic', clean = TRUE)" # as.binary
#RUN R -e "install.packages('Cubist', clean = TRUE)"
#RUN R -e "install.packages('magrittr', clean = TRUE)"    # to plot keras model graphically
#RUN R -e "install.packages('factoextra', clean = TRUE)"  # to handle pca stuff
RUN R -e "install.packages(c('RcppGSL','Rfast','sharpshootR','binaryLogic','Cubist','deepviz','magrittr','factoextra'),clean=TRUE,dependencies=TRUE)"

# deepviz, install error: 
#   unable to load shared object '/usr/local/lib/R/site-library/igraph/libs/igraph.so':
#   libglpk.so.40: cannot open shared object file: No such file or directory
#RUN R -e "devtools::install_github("andrie/deepviz")"     # to plot keras model graphically

# See https://geocompr.robinlovelace.net/geometric-operations.html#raster-vector
RUN R -e "remotes::install_github('Nowosad/spDataLarge')"

# install specific package version, otherwise I get issues in using "pedons" across different R versions
# aqp 1.18.1 is the version used in Sydney when I started the elaborations => this did not solve the issue
# of having 1 soil profile in pedons object in R-Studio server. Indeed, in R-Studio on Mac there is no issue.
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/aqp/aqp_1.18.1.tar.gz', repos=NULL, type='source')"
#RUN R -e "install.packages('aqp', dependencies=TRUE, clean = TRUE)"

# install keras ####
# 	see https://tensorflow.rstudio.com/installation/
# ============ UP-TO-DATE 20-Sep-2021 ============
#--- linux os | ROOT ---
# apt install python3-pip python3-venv # done above
#--- linux os | GIULIANO ---
RUN pip install --upgrade pip
# pip --version # using latest version of python, 3.8
RUN pip install tensorflow
#--- RStudio UI ---
RUN R -e "install.packages('reticulate',clean=TRUE)" # not this devtools::install_github("rstudio/reticulate")
RUN R -e "install.packages('tensorflow',clean=TRUE)"
#--- RStudio UI ---
#require(tensorflow)
#install_tensorflow()
#RUN R -e "require(tensorflow); install_tensorflow()"
RUN R -e "install.packages('keras',clean=TRUE)"
#require(keras) # it works
#=USELESS=
#RUN R -e "devtools::install_github('rstudio/tensorflow')"
#--- linux os | GIULIANO ---
#/usr/bin/python3 -m easy_install --upgrade --user pip
#/usr/bin/python3 -m pip install --upgrade --user virtualenv
#python3 -m venv ~/tensorflow-metal
#source ~/tensorflow-metal/bin/activate  # this activates the virtual environment
#python -m pip install -U pip            # this should be useless
##install_tensorflow(method = 'auto',envname='~/tensorflow-metal/bin/activate') # it asks to install miniconda, set Yes

# install soilDB
# Package ‘soilDB’ was removed from the CRAN repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/soilDB_2.4.1.tar.gz',repos = NULL, type = 'source')

# install sharpshooteR
# the package is currently (23-Jan-2020) removed from repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/sharpshootR_1.5.tar.gz',repos = NULL, type = 'source')
