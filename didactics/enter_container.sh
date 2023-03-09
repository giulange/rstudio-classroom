#!/bin/bash
#
# DESCRIPTION
#  Enter the docker container given in the first input.
#
# USAGE
#  ./enter_container.sh { gevs | plf | mgs }

echo "docker exec -it -u root rstudio_didattica_$1 /bin/bash"
docker exec -it -u root rstudio_didattica_$1 /bin/bash

