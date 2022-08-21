#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # create directories
  mkdir -p $DATA_DIR/$LOGIN_42.42.fr/public
  mkdir -p $DATA_DIR/logs/php-fpm
  mkdir -p $DATA_DIR/logs/www
  # change DATA_DIR ownership
  chown -R www-data:www-data $DATA_DIR 
  # change secrets ownership
  chown -R www-data:www-data /run/secrets
  # start php-fpm as www-data
  exec php-fpm7.3
fi

exec "$@"