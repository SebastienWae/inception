#!/usr/bin/env bash

if [ "$1" = 'static' ]; then
  if [ ! -d "$DATA_DIR/static.42.fr" ]; then
    git clone https://github.com/SebastienWae/debugging-42.git static.42.fr
  fi

  cd static.42.fr
  npm install

  exec npm run serve -- --build --port 80 --host 0.0.0.0
fi

exec "$@"