# Giuliano Langella
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

#  - required package for research
install.packages("RcppGSL",dependencies=TRUE, clean=TRUE)
install.packages("Rfast",dependencies=TRUE, clean=TRUE)


#  - from git:
devtools::install_github('IVFL-BOKU/sentinel2')
devtools::install_github('giulange/cubeR')

# Domenico Vistocco:
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

