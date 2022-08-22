#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # create directories
  mkdir -p $DATA_DIR/swaegene.42.fr/public
  mkdir -p $DATA_DIR/logs/php-fpm
  mkdir -p $DATA_DIR/logs/www
  chown -R www-data:www-data $DATA_DIR/swaegene.42.fr

  if [ ! -e $DATA_DIR/swaegene.42.fr/public/index.php ]; then
    wp_cli() {
      gosu www-data php wp-cli.phar $@ --path=$DATA_DIR/swaegene.42.fr/public
    }
    # download wordpress-cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # download wordpress
    wp_cli core download 
    # create config file
    wp_cli config create --dbname=wordpress --dbuser=wordpress --dbpass=$(< /run/secrets/mariadb_wordpress_password) --dbhost=mariadb:3306
    # create database
    wp_cli db create --path=$DATA_DIR/swaegene.42.fr/public
    # install wordpress
    wp_cli core install --url=swaegene.42.fr --title=Inception --admin_user=swaegene --admin_password=$(< /run/secrets/swaegene.42.fr_admin_password) --admin_email=swaegene@student.42mulhouse.fr --skip-email
    # create user
    wp_cli user create user user@example.com --role=author --user_pass=$(< /run/secrets/swaegene.42.fr_user_password)
    # TODO remove wordpress-cli 
    # rm -f wp-cli.phar
  fi

  # start php-fpm as www-data
  exec php-fpm7.3
fi

exec "$@"