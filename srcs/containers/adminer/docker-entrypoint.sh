#!/usr/bin/env bash

if [ "$1" = 'adminer' ]; then
  if [ ! -d "$DATA_DIR/adminer.42.fr" ]; then
    mkdir -p "$DATA_DIR/adminer.42.fr"
	  cp adminer.php $DATA_DIR/adminer.42.fr/index.php
  fi
fi

exec "$@"