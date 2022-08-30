#!/usr/bin/env bash

if [ "$1" = 'goaccess' ]; then
  if [ ! -d "$DATA_DIR/goaccess.42.fr" ]; then
    mkdir -p $DATA_DIR/goaccess.42.fr
  fi

  chown -R www-data:www-data "$DATA_DIR/goaccess.42.fr"
  rm /tmp/*

  exec goaccess $DATA_DIR/logs/nginx/access.log -o $DATA_DIR/goaccess.42.fr/index.html
fi

exec "$@"