#!/usr/bin/env sh
# Make the soft rebuilding of the App (app data saved in)

# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \

docker rm $(docker ps -qa); \

docker network rm $(docker network ls -q); \

sudo rm -rf docker/.dbdata; \
sudo rm -rf docker/.data; \

make \
    --debug=all \
    --warn-undefined-variables \
    --trace && \
printf "\n\tMakefile: Completed. Build success!\n\n";




## Removes last 6 created containers:
#docker rm -f -v --last=6