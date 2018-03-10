FROM php:7.2-fpm

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
    	libicu-dev \
        libjpeg-dev \
    	libmcrypt-dev \
        libpng-dev \
        libssl-dev \
    	zlib1g-dev \
    && docker-php-ext-install mbstring exif iconv intl pdo_mysql zip

RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

ARG SERVER_NAME
ENV SERVER_NAME=$SERVER_NAME

ADD ./files /usr/local/etc/php/conf.d

WORKDIR /var/www/$SERVER_NAME
