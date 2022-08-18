#!/usr/bin/env bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

rand_str() {
  openssl rand -base64 32
}

echo "ADMIN_USERNAME=$USER" > "$SCRIPT_PATH/srcs/.env-admin"
echo "ADMIN_PASSWORD=$(rand_str())" > "$SCRIPT_PATH/srcs/.env-admin"

echo "USER_USERNAME=user" > "$SCRIPT_PATH/srcs/.env-user"
echo "USER_PASSWORD=$(rand_str())" > "$SCRIPT_PATH/srcs/.env-user"

echo "MARIADB_ROOT_PASSWORD=$(rand_str())" > "$SCRIPT_PATH/srcs/.env-mariadb"