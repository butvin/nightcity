FROM node:lts-alpine
WORKDIR /app/app-client
COPY ./package.json/ /app-client/
RUN npm install
CMD "npm" "start"


#FROM debian:11
#
#ARG env
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#RUN set -eux; \
#     apt-get update && apt-get upgrade -y;
#RUN set -eux; \
#    apt-get update && apt-get install -y \
#        bash \
#        curl \
#        wget \
#        git
#
#WORKDIR /app-client
#
#EXPOSE 3000
#
#CMD ["bash"]
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# App-Client Docker container
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#set COLOR_SUCCESS="printf \\033[1;32m"
#set COLOR_FAILURE="printf \\033[1;31m"
#set COLOR_WARNING="printf \\033[1;33m"
#set COLOR_NORMAL="printf \\033[0;39m"

#RUN set -eux; \
#     apk add --no-cache \
#        curl \
#        libc6-compat \
#        libffi-dev \
#        linux-headers \
#        py-pip \
#        py-cryptography \
#        pv && \
#    rm -rf \
#        /var/cache/apk/* \
#        /tmp/* \
#        /var/tmp/*
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#RUN apk add --no-cache --virtual .build-deps \
#    gcc \
#    freetype-dev \
#    musl-dev && \
#RUN pip install --no-cache-dir <packages_that_require_gcc...> \
#RUN apk del .build-deps
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Storage
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#FROM busybox
#
#RUN mkdir /storage \
#    && chmod 1777 /storage
#
#VOLUME "/storage"

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PHP7
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
#        php7-zip \
#    \;
#
#RUN rc-service php-fpm7 start
