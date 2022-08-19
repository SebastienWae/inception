#!/usr/bin/env bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

rand_str() {
  openssl rand -base64 32
}

echo "ADMIN_USERNAME=$(rand_str)" > "$SCRIPT_PATH/srcs/.env"
echo "ADMIN_PASSWORD=$(rand_str)" >> "$SCRIPT_PATH/srcs/.env"
echo "USER_USERNAME=$(rand_str)" >> "$SCRIPT_PATH/srcs/.env"
echo "USER_PASSWORD=$(rand_str)" >> "$SCRIPT_PATH/srcs/.env"
echo "LOGIN_42=$USER" >> "$SCRIPT_PATH/srcs/.env"
echo "DATA_DIR=/home/$USER/data" >> "$SCRIPT_PATH/srcs/.env"

echo "MARIADB_ROOT_PASSWORD=$(rand_str)" > "$SCRIPT_PATH/srcs/.mariadb-env"