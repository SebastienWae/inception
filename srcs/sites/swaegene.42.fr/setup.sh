#!/usr/bin/env bash

if [ ! -e $DATA_DIR/swaegene.42.fr ]; then
  mkdir -p $DATA_DIR/swaegene.42.fr/wordpress
  chown -R www-data:www-data $DATA_DIR/swaegene.42.fr

  cd $DATA_DIR/swaegene.42.fr/wordpress

  DB_NAME=wordpress
  DB_USER=wordpress
  DB_PASS=$(< /run/secrets/mariadb_wordpress_password)
  DB_HOST=mariadb:3306
  URL=https://swaegene.42.fr
  TITLE=Inception
  ADMIN_USER=swaegene
  ADMIN_PASS=$(< /run/secrets/swaegene.42.fr_admin_password)
  ADMIN_EMAIL=swaegene@student.42mulhouse.fr
  USER_USER=user
  USER_PASS=$(< /run/secrets/swaegene.42.fr_user_password)
  USER_EMAIL=user@example.com
  REDIS_HOST=redis
  REDIS_PORT=6379
  REDIS_PASS=$(< /run/secrets/redis_password)

  gosu www-data wp core download 
  gosu www-data wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST
  gosu www-data wp config set WP_SITEURL $URL
  gosu www-data wp core install --url="$URL" --title="$TITLE" --admin_user=$ADMIN_USER --admin_password= --admin_email=$ADMIN_EMAIL --skip-email
  gosu www-data wp user create $USER_USER $USER_EMAIL --role=author --user_pass=$USER_PASS

  gosu www-data wp config set WP_REDIS_CLIENT phpredis
  gosu www-data wp config set WP_REDIS_SCHEME tcp
  gosu www-data wp config set WP_REDIS_HOST $REDIS_HOST
  gosu www-data wp config set WP_REDIS_PORT $REDIS_PORT
  gosu www-data wp config set WP_REDIS_PASSWORD $REDIS_PASS
  gosu www-data wp plugin install redis-cache --activate
fi