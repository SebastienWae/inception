FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gosu \
  # install nginx
  && apt-get -y install nginx nginx-plus-module-lua \
  # create nginx run directory
  && mkdir /var/run/nginx \
  && chown -R www-data:www-data /var/run/nginx

# copy the nginx config
COPY --chown=www-data nginx.conf /etc/nginx

RUN set -eux \
  # substitute environment variables
  && sed -i "s#DATA_DIR#$DATA_DIR#g" /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["nginx"]