# the **`Night City Project`**

***

Short overviews, instructions and commands, scripts and samples for maintaining internal docker services and the App in generally.

 - 6 separated containers with servers/services in the box;
 - `Nginx 1.21.3` in **nginx** container. Listen on [http://127.0.0.1:80/](http://127.0.0.1:80/)
 - `PHP 8.0.11` (stable) and stack inside **php8-fpm** on `9000` port
   - `Zend Engine v4.0.11`,
   - with `Zend OPcache v8.0.11`, Copyright (c),
   - with `Xdebug v3.0.4` on 9003,
   - with `Composer v2.1.9`,
 - `Symfony 4.4 LTS` Framework /SF4.4 or SF4.4LTS/  ( ~~or~~ [Symfony 5.3 /SF5.3/](https://github.com/butvin/galera))
 - `Mariadb 10.6.4` served via `3306` port in **db-server**
 - `Redis 5.x` in **redis** container
 - `RabbitMQ 3.9.5` listens on `15672` port at `127.0.0.1` - **rabitmq** container as async worker on **php8-cli**


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

