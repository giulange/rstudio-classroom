# Here I install all the packages required for research purposes 

#  - you need to install dependencies first:
install.packages('rgdal', clean = TRUE)
install.packages('sf', clean = TRUE)
install.packages('rgeos', clean = TRUE)
install.packages("tmap", clean = TRUE)

#  - required packages for didactics:
install.packages('raster', clean = TRUE)
install.packages('sp', clean = TRUE)
install.packages('gstat', clean = TRUE) 
install.packages('osmdata', clean = TRUE)
install.packages('devtools',clean = TRUE) 

#  - required package for boku research
install.packages("RcppGSL",dependencies=TRUE, clean=TRUE)
install.packages("Rfast",dependencies=TRUE, clean=TRUE)

#  - from git:
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
# LIBRARIES

# install keras ####
# # see https://stackoverflow.com/questions/57353429/install-tensorflow-on-r
# # keras requires tensorFlow, which requires reticulate:
# #   > after some issues:
# #        > XLA service 0x136209e30 executing computations on platform Host. Devices:
# #        >   StreamExecutor device (0): Host, Default Version
# #     I skipped this installation
# # install.packages("reticulate")
# #     and performed the following one:
# #     [ https://github.com/rstudio/keras/issues/33 ]
# devtools::install_github("rstudio/reticulate") # this worked!
# # install.packages("tensorflow") # it did not work!
# devtools::install_github("rstudio/tensorflow") # this worked!
# library(tensorflow)
# -- may require this, for instance within a docker --
# /usr/bin/python2.7 -m easy_install --upgrade --user pip
# /usr/bin/python2.7 -m pip install --upgrade --user virtualenv
# ----
# install_tensorflow('conda')
# library(keras)
# to plot keras model graphically:
# devtools::install_github("andrie/deepviz")
# 
# IN CASE OF ISSUES WITH KERAS, RUN THE FOLLOWING:
# pip install keras==2.1.3 [terminal]
# devtools::install_github("rstudio/keras") [R]
# and see https://github.com/rstudio/keras/issues/285


# install soilDB
# Package ‘soilDB’ was removed from the CRAN repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/soilDB_2.4.1.tar.gz',repos = NULL, type = 'source')

# install sharpshooteR
# the package is currently (23-Jan-2020) removed from repository.
# I downloaded a formerly available version and installed manually from source:
# install.packages('~/Downloads/sharpshootR_1.5.tar.gz',repos = NULL, type = 'source')


# LOAD ####
require(readr)
require(dplyr)

# install specific package version, otherwise I get issues in using "pedons" across different R versions
# aqp 1.18.1 is the version used in Sydney when I started the elaborations => this did not solve the issue
# of having 1 soil profile in pedons object in R-Studio server. Indeed, in R-Studio on Mac there is no issue.
# install.packages( 'https://cran.r-project.org/src/contrib/Archive/aqp/aqp_1.18.1.tar.gz', repos=NULL, type='source')
require(aqp)

require(stringr)     # str_remove
require(sharpshootR) # plotSoilRelationGraph
require(corrplot)
require(lattice)
require(sp)          # proj4string
require(binaryLogic) # as.binary
library(Cubist)
library(reticulate)
library(keras)
library(ggplot2)
library(deepviz)     # to plot keras model graphically
library(magrittr)    # to plot keras model graphically
# [ http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/118-principal-component-analysis-in-r-prcomp-vs-princomp/ ]
library(factoextra)  # to handle pca stuff
library(gstat)       # for indicator kriging of Pr(transition) between 2 horizons
library(raster)
library(sf)
library(rgdal)

# See https://geocompr.robinlovelace.net/geometric-operations.html#raster-vector
# remotes::install_github("Nowosad/spDataLarge")
# library(spDataLarge)



