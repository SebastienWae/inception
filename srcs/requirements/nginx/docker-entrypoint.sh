#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  # create log directory
  mkdir -p $DATA_DIR/logs/nginx
  # change DATA_DIR ownership
  chown -R www-data:www-data $DATA_DIR 
  # start nginx as www-data
  exec gosu www-data nginx -g "daemon off;"
fi

exec "$@"