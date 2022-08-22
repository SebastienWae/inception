FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities 
  && apt-get install -y curl gosu \
  # install php
  && apt-get install -y php7.3-fpm php7.3-mysql php7.3-common php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap \
  # install mysql client
  && apt-get install -y mariadb-client

# copy php-fpm config
COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["wordpress"]