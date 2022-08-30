#!/usr/bin/env bash

if [ "$1" = 'redis' ]; then
  if [ ! -d "$DATA_DIR/logs/redis" ]; then
    mkdir -p $DATA_DIR/logs/redis
    chown -R redis:redis $DATA_DIR/logs

    sed -i "s/REDIS_PASSWORD/$(< /run/secrets/redis_password)/" /etc/redis/redis.conf
  fi

  exec gosu redis redis-server /etc/redis/redis.conf
fi

exec "$@"