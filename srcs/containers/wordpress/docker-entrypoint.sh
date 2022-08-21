#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # create directories
  mkdir -p $DATA_DIR/swaegene.42.fr/public
  mkdir -p $DATA_DIR/logs/php-fpm
  mkdir -p $DATA_DIR/logs/www
  # start php-fpm as www-data
  exec php-fpm7.3
fi

exec "$@"