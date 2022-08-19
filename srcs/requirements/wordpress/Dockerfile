FROM debian:buster

ARG DATA_DIR
ARG LOGIN_42

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gettext-base gosu \
  # install php
  && apt-get install -y php7.3-fpm php7.3-mysql php7.3-common php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap \
  # fix stdout and stderr permissions
  && usermod -a -G tty www-data

# copy the php-fpm config
COPY --chown=www-data php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY --chown=www-data www.conf /etc/php/7.3/fpm/pool.d/www.conf 

# copy the nginx server config
COPY --chown=www-data wordpress-nginx.conf $DATA_DIR/nginx/conf.d/$LOGIN_42.42.fr.conf

# copy the SSL certificate
COPY --chown=www-data *.42.fr* $DATA_DIR/$LOGIN_42.42.fr/ssl/

RUN set -eux \
    # substitute environment variables
    && envsubst '$$DATA_DIR $$LOGIN_42' < $DATA_DIR/nginx/conf.d/$LOGIN_42.42.fr.conf > $DATA_DIR/nginx/conf.d/$LOGIN_42.42.fr.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["wordpress"]