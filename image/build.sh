# https://medium.com/@guidoman/tutorial-install-and-run-rstudio-server-with-docker-5e67607811a0

defval=" " # " --no-cache"
CACHE=${1:-$defval}

defval=rocker/tidyverse:latest
IMAGE=${2:-$defval}
#IMAGE=rocker/tidyverse:latest

# docker pull $IMAGE
echo "docker build $CACHE -t $IMAGE -f Dockerfile . "
docker build $CACHE -t $IMAGE -f Dockerfile . 
