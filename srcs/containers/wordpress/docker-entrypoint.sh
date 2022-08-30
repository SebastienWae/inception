#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  if [ ! -d "$DATA_DIR/logs/php-fpm" ]; then
    mkdir -p $DATA_DIR/logs/php-fpm
    mkdir -p $DATA_DIR/logs/www
    mkdir -p /var/www
    chown -R www-data:www-data /var/www
    chown -R www-data:www-data $DATA_DIR/logs
  fi

  if [ ! -d "$DATA_DIR/swaegene.42.fr/wordpress" ]; then
    source $DATA_DIR/swaegene.42.fr/setup.sh
    chown -R www-data:www-data $DATA_DIR/swaegene.42.fr
  fi
  fi

  exec php-fpm7.3
fi

exec "$@"