# rstudio-server

## Web App for Students
The web app is available to students at `http://rstudio-classroom.ddns.net/`
It is based on the docker container rstudio-didattica using a docker port 8686 which is redirected to the public url above.

### Deafult credentials
usr: rstudio 
pswd: eRtf321-a2 [DEFAULT] 


## RStudio Server Management

 01. Documentation
 goto https://docs.rstudio.com/ide/server-pro/index.html

 02. In case of issues with a Student not able to access the session, 
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

