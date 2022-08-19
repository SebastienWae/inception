#!/usr/bin/env bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$SCRIPT_PATH/srcs/requirements/wordpress/$USER".42.fr.key \
  -out "$SCRIPT_PATH/srcs/requirements/wordpress/$USER".42.fr.crt \
  -subj "/CN=$USER.42.fr"

chmod -u=r "$SCRIPT_PATH/srcs/requirements/wordpress/$USER".42.fr.key
chmod -u=r "$SCRIPT_PATH/srcs/requirements/wordpress/$USER".42.fr.crt