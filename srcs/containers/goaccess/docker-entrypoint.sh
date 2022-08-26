#!/usr/bin/env bash

if [ "$1" = 'goaccess' ]; then
  # clear pipe
  rm /tmp/*

  # create goaccess.42.fr dir
  mkdir -p $DATA_DIR/goaccess.42.fr

  # start goaccess
  exec goaccess $DATA_DIR/logs/nginx/access.log -o $DATA_DIR/goaccess.42.fr/index.html
fi

exec "$@"