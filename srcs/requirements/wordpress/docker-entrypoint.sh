#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # start php-fpm as www-data
  exec gosu www-data php-fpm7.3
fi

exec "$@"