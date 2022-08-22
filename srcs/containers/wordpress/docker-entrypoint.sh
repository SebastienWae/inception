#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
  # create directories
  mkdir -p $DATA_DIR/swaegene.42.fr/public
  mkdir -p $DATA_DIR/logs/php-fpm
  mkdir -p $DATA_DIR/logs/www
  mkdir -p /var/www
  chown -R www-data:www-data $DATA_DIR/swaegene.42.fr
  chown -R www-data:www-data /var/www

  if [ ! -e $DATA_DIR/swaegene.42.fr/public/index.php ]; then
    wp_cli() {
      gosu www-data php $DATA_DIR/wp-cli.phar $@
    }
    # download wordpress-cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # cd to wordpress install dir
    cd $DATA_DIR/swaegene.42.fr/public
    # download wordpress
    wp_cli core download 
    # create config file
    wp_cli config create --dbname=wordpress --dbuser=wordpress --dbpass=$(< /run/secrets/mariadb_wordpress_password) --dbhost=mariadb:3306 --extra-php <<< "define( 'WP_SITEURL', 'https://swaegene.42.fr' );"
    # install wordpress
    wp_cli core install --url="https://swaegene.42.fr" --title=Inception --admin_user=swaegene --admin_password=$(< /run/secrets/swaegene.42.fr_admin_password) --admin_email=swaegene@student.42mulhouse.fr --skip-email
    # create user
    wp_cli user create user user@example.com --role=author --user_pass=$(< /run/secrets/swaegene.42.fr_user_password)
  fi

  # start php-fpm as www-data
  exec php-fpm7.3
fi

exec "$@"