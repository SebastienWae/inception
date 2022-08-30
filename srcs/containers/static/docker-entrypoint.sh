#!/usr/bin/env bash

if [ "$1" = 'static' ]; then
  cd static.42.fr
  npm install

  exec npm run serve -- --build --port 80 --host 0.0.0.0
fi

exec "$@"