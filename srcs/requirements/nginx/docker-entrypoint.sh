#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  # start nginx as www-data
  exec gosu www-data nginx -g "daemon off;"
fi

exec "$@"