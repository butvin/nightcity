# the **`Night City Project`**

***

Short overviews, instructions and commands, scripts and samples for maintaining internal docker services and the App in generally.

 - 6 separated containers with servers/services in the box;
 - Nginx 1.21.3 in **nginx** container. Listen on `http://127.0.0.1:80/`
 - `PHP 8.1.x` (**php-fpm** & **php-cli**), `Composer 2.x`, `NPM 7.x` with webpack (EncoreWebpack) `Opcache`, `Redis` uses sessions storing are in **php8-fpm** container. RabbitMQ as async worker on **php8-cli**
 - `Symfony 4.4 LTS` Framework /SF4.4 or SF4.4LTS/  ( ~~or~~ [Symfony 5.3 /SF5.3/](https://github.com/butvin/galera))
 - `Mariadb 10.6.4` served on `3306` port
 - `Redis 5.x`
 - `RabbitMQ 3.9.5` listens on `15672` port at `127.0.0.1`


## Pre-Build configure environments

---

 - shutdown & remove from system all active `/? no active ?/` running docker applications, containers, volumes, links and docker networks:

```bash
bash ./docker/rebuild.sh
#bash ./docker/rebuild-hard.sh
```

or

```bash
#!/usr/bin/env bash
# shellcheck disable=SC2046
docker stop $(docker ps -qa); \

docker rm -fv $(docker ps -qa); \

## !This action removes all images pulled from DockerHub
#docker rmi -f $(docker images -qa); \

docker volume rm -f $(docker volume ls -q); \

docker network rm $(docker network ls -q); \

docker system prune -af
```


 - Checking your current configuration and environments.
 
```bash
bash ./docker/check-config.sh
```

 - `gl hf` etc...

### Build up

---

Be a sure you at root directory og your project. Then run only one and simple command:

```bash
make
```

You can to specify with [`make`](https://www.opennet.ru/man.shtml?topic=make&category=1&russian=0) command some options such as debug in my case. 


```bash
make \
    --debug=all \
    --warn-undefined-variables \
    --trace
```

