FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install nginx
  && apt-get -y install nginx curl \
  # create nginx run directory
  && mkdir /var/run/nginx

# copy the nginx config
COPY nginx.conf /etc/nginx

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["nginx"]