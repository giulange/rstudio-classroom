
# DO NOT USE THE FOLLOWING: THEY DID NOT WORK PROPERLY.

#docker exec --privileged --user root -it rstudio useradd giuliano -p wed-12-3-E_d-

#docker exec --privileged --user root -it rstudio  /bin/bash -c "/usr/sbin/adduser --disabled-password --gecos '' admin; echo admin:wed-12-3-E_d- | chpasswd;"

docker exec --privileged --user root -it rstudio  /bin/bash -c "/usr/sbin/adduser --disabled-password --gecos '' giuliano; echo giuliano:wed-12-3-E_d- | chpasswd;"

