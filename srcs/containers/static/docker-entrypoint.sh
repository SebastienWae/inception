#!/usr/bin/env bash

if [ "$1" = 'static' ]; then
  # clone site
  git clone https://github.com/SebastienWae/debugging-42.git static.42.fr

  # install 
  cd static.42.fr
  npm install

  # run server
  exec npm run serve -- --build --port 80 --host 0.0.0.0
fi

exec "$@"