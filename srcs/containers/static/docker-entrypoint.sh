#!/usr/bin/env bash

if [ "$1" = 'static' ]; then
  if [ ! -d "$DATA_DIR/static.42.fr" ]; then
    npx create-docusaurus@latest static.42.fr classic
  fi
  cd $DATA_DIR/static.42.fr
  exec npm run serve -- --build --port 80 --host 0.0.0.0
fi

exec "$@"