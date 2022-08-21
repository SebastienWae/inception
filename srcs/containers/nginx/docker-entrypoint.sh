#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  # create log directory
  mkdir -p $DATA_DIR/logs/nginx
  # start nginx as www-data
  exec nginx -g "daemon off;"
fi

exec "$@"