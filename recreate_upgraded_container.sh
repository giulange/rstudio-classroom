#!/bin/bash

container=rstudio_research

echo "Recreating the $container RStudio for research purposes..."

# 01. upgrade the docker image
echo "  building the new IMAGE..."
sh build.sh
echo "  ...done"
echo ""

# 02. remove existent container
echo "  Removing the CURRENT container..."
echo "    ...stopping $container"
docker container stop $container
echo "    ...removing $container"
docker container rm   $container
echo "  ...done"
echo ""

# 03. create container called rstudio_research
echo "  Run the NEW container..."
./run_research.sh $container
echo "...done"
echo ""

# 04. install dependencies required by my research targets
echo "  Install OS dependencies in new container..."
./install_dep.sh $container
echo "...done"
echo ""

# 05 install R packages
# ...
docker exec --privileged \
            --user root \
            -it $container \
            /bin/bash -c "Rscript /home/giuliano/git/rstudio-server/install_packages_research.R"

