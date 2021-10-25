# Here I install all the packages install.packagesd for research purposes 

#  - you need to install dependencies first:
install.packages('devtools',clean = TRUE) 
install.packages('sp', clean = TRUE)
install.packages('rgdal', clean = TRUE)
install.packages('rgeos', clean = TRUE)
install.packages("tmap", clean = TRUE)
install.packages("plyr", clean = TRUE)
install.packages("reshape", clean = TRUE)
install.packages("plotrix", clean = TRUE)
install.packages('ggplot2', clean = TRUE)
install.packages('corrplot', clean = TRUE)
install.packages('lattice', clean = TRUE)
install.packages('stringr', clean = TRUE)     # str_remove

#  - required packages for didactics:
install.packages('sf', clean = TRUE)
install.packages('raster', clean = TRUE)
install.packages('gstat', clean = TRUE) 
install.packages('osmdata', clean = TRUE)
install.packages('ows4R', clean = TRUE)

#  - required package for research
install.packages("RcppGSL",dependencies=TRUE, clean=TRUE)
install.packages("Rfast",dependencies=TRUE, clean=TRUE)

#  - installed from github:
devtools::install_github('IVFL-BOKU/sentinel2')
devtools::install_github('giulange/cubeR')

#  - required for didactics by Domenico Vistocco:
install.packages("janitor", clean = TRUE)
install.packages("infer", clean = TRUE)
install.packages("gtools", clean = TRUE)
install.packages("tidymodels", clean = TRUE)
install.packages("ggthemes", clean = TRUE)
install.packages("ggsci", clean = TRUE)
install.packages("kable", clean = TRUE)
install.packages("kableExtra", clean = TRUE)
install.packages("gt", clean = TRUE)
install.packages("DT", clean = TRUE)
install.packages("FactoMineR", clean = TRUE)
install.packages("factoextra", clean = TRUE)
install.packages("skimr", clean = TRUE)
install.packages("ggridges", clean = TRUE)
install.packages("ggeconodist", repos = "https://cinc.rud.is", clean = TRUE)
install.packages("corrr", dep = TRUE)
devtools::install_github("thomasp85/patchwork")

#  - required packages for research
install.packages('sharpshootR', dependencies=TRUE, clean = TRUE) # plotSoilRelationGraph
install.packages('binaryLogic', clean = TRUE) # as.binary
install.packages('Cubist', clean = TRUE)
install.packages('deepviz', clean = TRUE)     # to plot keras model graphically
install.packages('magrittr', clean = TRUE)    # to plot keras model graphically
install.packages('factoextra', clean = TRUE)  # to handle pca stuff

# install specific package version, otherwise I get issues in using "pedons" across different R versions
# aqp 1.18.1 is the version used in Sydney when I started the elaborations => this did not solve the issue
# of having 1 soil profile in pedons object in R-Studio server. Indeed, in R-Studio on Mac there is no issue.
install.packages('https://cran.r-project.org/src/contrib/Archive/aqp/aqp_1.18.1.tar.gz', repos=NULL, type='source')
# install.packages('aqp', dependencies=TRUE, clean = TRUE)

# See https://geocompr.robinlovelace.net/geometric-operations.html#raster-vector
remotes::install_github("Nowosad/spDataLarge")
# library(spDataLarge)

# install soilDB
# Package ‘soilDB’ was removed from the CRAN repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/soilDB_2.4.1.tar.gz',repos = NULL, type = 'source')

# install sharpshooteR
# the package is currently (23-Jan-2020) removed from repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/sharpshootR_1.5.tar.gz',repos = NULL, type = 'source')

# install keras ####
# ============ UP-TO-DATE 20-Sep-2021 ============
#--- linux os | ROOT ---
# apt install python3-pip python3-venv
#--- linux os | GIULIANO ---
# pip install --upgrade pip
# pip --version # using latest version of python, 3.8
# pip install tensorflow
#--- RStudio UI ---
# install.packages("reticulate") # not this devtools::install_github("rstudio/reticulate")
# devtools::install_github("rstudio/tensorflow")
# library(tensorflow)
#--- linux os | GIULIANO ---
# /usr/bin/python3 -m easy_install --upgrade --user pip
# /usr/bin/python3 -m pip install --upgrade --user virtualenv
# python3 -m venv ~/tensorflow-metal
# source ~/tensorflow-metal/bin/activate  # this should be useless
# python -m pip install -U pip            # this should be useless
#--- RStudio UI ---
# install_tensorflow(method = 'auto',envname='~/tensorflow-metal/bin/activate') # it asks to install miniconda, set Yes
# require(keras) # it works
