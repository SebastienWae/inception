#!/usr/bin/env bash

rand_str() {
  openssl rand -base64 20 
}

mkdir -p srcs/secrets

rand_str > srcs/secrets/mariadb_root_password
rand_str > srcs/secrets/mariadb_wordpress_password
rand_str > srcs/secrets/swaegene.42.fr_admin_password
rand_str > srcs/secrets/swaegene.42.fr_user_password