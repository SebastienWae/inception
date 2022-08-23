#!/usr/bin/env bash

if [ "$1" = 'redis' ]; then
  # create log directory
  mkdir -p $DATA_DIR/logs/redis
  chown -R redis:redis $DATA_DIR/logs/redis

  # set redis password
  sed -i "s/REDIS_PASSWORD/$()/" /etc/redis/redis.conf

  # start server as redis user
  exec gosu redis redis-server
fi

exec "$@"