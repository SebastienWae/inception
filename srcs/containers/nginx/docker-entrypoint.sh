#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  if [ ! -d "$DATA_DIR/logs/nginx" ]; then
    mkdir -p $DATA_DIR/logs/nginx
  fi

  chown -R www-data:www-data "$DATA_DIR/logs"

  exec nginx -g "daemon off;"
fi

exec "$@"