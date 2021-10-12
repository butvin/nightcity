## version 1.0.0



## Build up service
#*******************************************************************************
build: \
	up-infrastructure \
	ps \
	overview

up-infrastructure:
	docker-compose \
		--env-file .env \
		-f 'docker-compose.yml' \
		-p 'nightcity' \
	up --build -d


overview:
	docker exec -it php8-fpm bash -c 'php -v'



## Service common instructions
#*******************************************************************************
php:
	docker exec -it php8-fpm bash

re:
	sh ./docker/rebuild.sh

re-soft:
	sh ./docker/rebuild-soft.sh

re-hard:
	sh ./docker/rebuild-hard.sh

composer:
	sh ./docker/composer-self-install.sh

ps:
	docker ps --format 'table \t{{ .Names }}\t{{ .Status }}\t{{ .Size }}'

pss:
	docker-compose -f docker-compose.yml ps


## TODO:
#**********************************************************************************************************************
#nginx_from_makefile:
#	docker run \
#		--name nginx-service \
#		-p 80:80 \
#		-e $APP_ENV=dev \
#		-d nginx:alpine

	#docker-compose -f .docker/docker-compose.yml up -d --build