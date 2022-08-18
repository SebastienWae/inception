FROM debian:buster

RUN set -eux \
  # update the packages & install php
  && apt update &&  apt -y install php7.3-fpm php7.3-mysql php7.3-common php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

# copy the php-fpm config
COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

# copy the php-fpm www config
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf 

CMD php-fpm7.3