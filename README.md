# rstudio-server

## host / container user
https://faun.pub/set-current-host-user-for-docker-container-4e521cef9ffc
https://www.cyberciti.biz/faq/linux-change-user-group-uid-gid-for-all-owned-files/

I found that it was easy to change the id of the container to fit the host one.
I have to execute in container

```
usermod -u 1002 giuliano
```

## Deafult credentials
usr: rstudio 
pswd: eRtf321-a2 [DEFAULT] 

## Notes about new install features

### OpenStreetMap
See this instructions which worked fine in MGS RStudio docker container:
https://www.r-bloggers.com/2018/02/installing-rjava-on-ubuntu/


## Didactics
### Web App for Students
The web app is available to students at `http://rstudio-classroom.ddns.net/`
It is based on the docker container rstudio-didattica using a docker port 8686 which is redirected to the public url above.

### workflow

From scratch:

 1. build_from_scratch_and_save.sh --> build.sh --> Dockerfile
 2. [build_uid.sh]
 3. rerun_didactics.sh
 4. install_dep.sh

To change the user and group IDs:
 1. build_uid.sh

## Research
### workflows to start a new instance (in VM or host)

Using the docker hub stored image rstudio_research:

 1. fetch_research.sh
 2. [build_uid.sh]
 3. rerun_research.sh

From scratch:

 1. build_from_scratch_and_save.sh --> build.sh --> Dockerfile
 2. [build_uid.sh]
 3. rerun_research.sh
 4. install_dep.sh

To change the user and group IDs:
 1. build_uid.sh

### Image build
#### DockerHub

See fetch script for the most up-to-date version:

```
docker pull giulange/pedometrics:rstudio-research-run1
docker tag giulange/pedometrics:rstudio-research-run1 rstudio_research
docker image rm giulange/pedometrics:rstudio-research-run1
```


## RStudio Server Management

 01. Documentation
 goto https://docs.rstudio.com/ide/server-pro/index.html

 02. In case of the issue "Unable to connect to service (1)" run `docker logs` and check if there's a problem writing the PID file, such as `var/run/rstudio-server/rstudio-rsession/giuliano-d.pid`. In that case, delete the PID file manually and it works.

 03. In case of issues with a Student not able to access the session, 
 follow instructions given [here](https://community.rstudio.com/t/rstudio-server-error-occurred-during-transmission/84258),
 that is:

 **LATEST:**
   1. enter the docker
   2. go to user home
   3. mv folders according to the following

      Choose which directory or directories to rename, via the command 

      ```
      sudo mv /home/user1/.local/share/rstudio /home/user1/.local/share/rstudio-old
      ```

      for example. This table shows the impact of the directory removal.

      Location	                When deleted
      ~/.config/rstudio/	All user settings (Global Options) lost
      ~/.local/share/rstudio/	All open files, tabs, and sessions deleted

      In most cases, you will only need to rename the 
      `.local/share/rstudio` directory to clear out the sessions, and the user settings are retained.
      Rename both directories to mimic a fresh installation for that user.


 OLD-FASHIONED:
   1. enter the docker
   2. go to user home, e.g. cd /home/Gaspare.Abate
   3. mv the .rstudio folder to .rstudio_old
   4. problem fixed


### Some sparse notes
Get the list of students with active sessions
`rstudio-server active-sessions`

Restart RStudio Server
`rstudio-server restart`

## about the docker management

Rocker docker image   --> https://hub.docker.com/r/rocker/rstudio

Notes on docker see   --> docker/README.md

### How to create a Class
 1.\ run build.sh [once!]
 2.\ run run_research.sh OR run_students.sh
 3.\ run install_dep.sh [changing argument container] 
# === OLD === 
 4.\ run users_create.sh OR users_create_with_fullName.sh [only for students]
 5.\ run add_DOCENTI.sh [configure add_DOCENTE_2_rstudio.sh & add_DOCENTI.sh before time]
# === NEW ===
 4.\ run create_CLASS_*.sh with calls add_USER_2_rstudio.sh adding both students and docenti

