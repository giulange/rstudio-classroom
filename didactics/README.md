# NOTES

## Deafult credentials
usr: rstudio 
pswd: eRtf321-a2 [DEFAULT] 

## URLs

### GeVS

Public   :   http://rstudio-gevs.crisp.myddns.me
Private  :   http://192.168.20.122:8787

### PLF

Public   :   http://rstudio-plf.crisp.myddns.me
Private  :   http://192.168.20.122:8686

### Master GIS Science

Public   :   http://rstudio-mgs.crisp.myddns.me
Private  :   http://192.168.20.122:8585


## Docker Management

### Reference Image
`rocker/tidyverse:latest`

### Containers
`rstudio_didattica_mgs`   port 8585 
`rstudio_didattica_gevs`  port 8686 
`rstudio_didattica_plf`   port 8787 

### Image & Container workflow

#### Create container from scratch:

 1. build_from_scratch_and_save.sh --> build.sh --> Dockerfile
 2. [build_uid.sh]
 3. rerun_didactics.sh
 4. install_dep.sh

#### To change the user and group IDs:
 1. build_uid.sh

#### Create a new class year after year
What is the best option?
 - remove the container and create a new one
 - preserve the container but delete current users

The current solution which I'm adopting is the second one by using this call:

```
clean_rstudio_container.sh [ <ENV> ]
```
