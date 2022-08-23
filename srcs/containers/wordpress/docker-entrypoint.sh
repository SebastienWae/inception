#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # create directories
  mkdir -p $DATA_DIR/logs/php-fpm
  mkdir -p $DATA_DIR/logs/www
  mkdir -p /var/www
  chown -R www-data:www-data /var/www

  # setup swaegene.42.fr
  source $DATA_DIR/swaegene.42.fr/setup.sh

  # start php-fpm as www-data
  exec php-fpm7.3
fi

exec "$@"