#!/usr/bin/env bash

ls -la /run/secrets

if [ "$1" = 'nginx' ]; then
  # create log directory
  mkdir -p $DATA_DIR/logs/nginx
  # change DATA_DIR ownership
  chown -R www-data:www-data $DATA_DIR 
  # change secrets ownership
  chown -R www-data:www-data /run/secrets
  # start nginx as www-data
  exec gosu www-data nginx -g "daemon off;"
fi

exec "$@"