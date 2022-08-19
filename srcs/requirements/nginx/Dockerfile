FROM debian:buster

ARG DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gosu \
  # install nginx
  && apt-get -y install nginx \
  # create directories
  && mkdir -p $DATA_DIR/logs/nginx \
  # change DATA_DIR ownership
  && chown -R www-data:www-data $DATA_DIR 

# copy the nginx config
COPY --chown=www-data nginx.conf /etc/nginx

RUN set -eux \
  # substitute environment variables
  && sed "s#DATA_DIR#$DATA_DIR#g" /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["nginx"]