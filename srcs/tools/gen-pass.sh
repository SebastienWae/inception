#!/usr/bin/env bash

rand_str() {
  cat /proc/sys/kernel/random/uuid | sed 's/[-]//g'
}

mkdir -p srcs/secrets

rand_str > srcs/secrets/mariadb_root_password
rand_str > srcs/secrets/mariadb_wordpress_password
rand_str > srcs/secrets/swaegene.42.fr_admin_password
rand_str > srcs/secrets/swaegene.42.fr_user_password
rand_str > srcs/secrets/redis_password
rand_str > srcs/secrets/ftp_password