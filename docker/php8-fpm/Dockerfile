#ARG PHP_VERSION='8.1.0RC3-fpm-alpine'
ARG PHP_VERSION='8.0.11-fpm-alpine'
FROM php:${PHP_VERSION}

ARG env

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apk update && apk upgrade && \
    apk add -u --update-cache \
        git \
        vim  \
        mc \
        curl \
        wget \
        tree \
        bash \
        zip \
        unzip \
        libzip-dev \
        fish \
        autoconf \
        ca-certificates && \
    rm -rf /var/cache/apk/*

RUN set -eux; \
	apk add -u --update-cache --virtual .build-deps \
		coreutils \
		dpkg-dev \
		dpkg \
		gcc \
		libc-dev \
		make \
    && docker-php-ext-install zip mysqli pdo pdo_mysql opcache \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

## xdebug
ARG XDEBUG_VERSION='3.0.4'
ARG AMQP_VERSION='1.11.0beta'

RUN pecl channel-update pecl.php.net

RUN set -eux; \
    apk add --no-cache $PHPIZE_DEPS && \
    pecl install -o -f xdebug-${XDEBUG_VERSION} && \
    docker-php-ext-enable \
        xdebug \
        && \
    touch /var/log/xdebug.log && \
    rm -rf /tmp/pear

## amqp
#ARG AMQP_VERSION='1.11.0beta'
#RUN set -eux; \
#    pecl install -o -f amqp-${AMQP_VERSION} && \
#    docker-php-ext-enable amqp

### redis
#RUN pecl install redis
#RUN docker-php-ext-enable redis

#RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## symfony cli
RUN set -eux; \
    wget https://get.symfony.com/cli/installer -O - | bash
RUN mv $HOME/.symfony/bin/symfony /usr/local/bin/symfony

## composer
RUN set -eux; \
    curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> $HOME/.bashrc \
    && composer -V


COPY www.conf /usr/local/etc/php-fpm.d

# todo
COPY dev/php.ini "$PHP_INI_DIR"/conf.d
COPY dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY dev/xdebug.ini "$PHP_INI_DIR"/conf.d

RUN docker-php-source delete && rm -rf /tmp/pear

WORKDIR "/app"

























































#ARG PHP_VERSION='8.0.11-fpm-alpine'

# libpng-dev needed by "gd" extension
# libzip-dev needed by "zip" extension
# libicu-dev for intl extension
# libpg-dev for connection to postgres database
# autoconf needed by "redis" extension

#RUN set -eux; \
#    apk --update add \
#        php7 \
#        php7-bcmath \
#        php7-ctype \
#        php7-curl \
#        php7-fpm \
#        php7-gd \
#        php7-iconv \
#        php7-intl \
#        php7-json \
#        php7-mbstring \
#        php7-mcrypt \
#        php7-mysqlnd \
#        php7-opcache \
#        php7-openssl \
#        php7-pdo \
#        php7-pdo_mysql \
#        php7-pdo_pgsql \
#        php7-pdo_sqlite \
#        php7-phar \
#        php7-posix \
#        php7-session \
#        php7-soap \
#        php7-xml \
#        php7-zip

#sudo rc-service php-fpm7 start
# ls /etc/php7/
#conf.d        php-fpm.conf  php-fpm.d     php.ini
#You can install vim and use it to modify configuration files.

#RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache
#RUN pecl update-channels

### amqp
#ARG AMQP_VERSION='1.11.0beta'
#RUN pecl install amqp-${AMQP_VERSION}
#RUN docker-php-ext-enable amqp

### xdebug
#ARG XDEBUG_VERSION='3.0.4'
#RUN pecl install xdebug-${XDEBUG_VERSION}
#RUN docker-php-ext-enable xdebug && touch /var/log/xdebug.log

### redis
#RUN pecl install -o -f redis
#RUN docker-php-ext-enable redis



#RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
#RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint

#RUN sed -i \
#    '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' \
#    /usr/local/bin/docker-php-entrypoint