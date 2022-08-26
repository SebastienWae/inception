#!/usr/bin/env bash

if [ "$1" = 'goaccess' ]; then
  # start goaccess
  exec goaccess $DATA_DIR/logs/nginx/access.log -o $DATA_DIR/goaccess.42.fr/index.html --log-format=COMBINED --real-time-html
fi

exec "$@"