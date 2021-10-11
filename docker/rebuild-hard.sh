#!/usr/bin/env sh
# Make the HARD rebuilding - all Apps data, volumes & containers will be lost

# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \

docker rm -f -v -l $(docker ps -qa); \

#docker rmi -f $(docker images -qa); \

docker volume rm -f $(docker volume ls -q); \

docker network rm $(docker network ls -q); \

docker system prune -af; \

sudo rm -rf .docker/.dbdata/*; \
sudo rm -rf .data; \
sudo rm -rf ./.dbdata; \

make \
    --debug=all \
    --warn-undefined-variables \
    --trace && \
printf "\n\tMakefile: Completed. Build success!\n\n";





## Removes last 6 created containers:
#docker rm -f -v --last=6