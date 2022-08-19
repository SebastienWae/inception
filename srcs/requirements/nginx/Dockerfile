FROM debian:buster

ARG DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gettext-base gosu \
  # install nginx
  && apt-get -y install nginx \
  # # forward request and error logs to docker log collector
  # && ln -sf /dev/stdout /var/log/nginx/access.log \
  # && ln -sf /dev/stderr /var/log/nginx/error.log \
  # fix stdout and stderr permissions
  && usermod -a -G tty www-data

# copy the nginx config
COPY --chown=www-data nginx.conf /etc/nginx

# RUN set -eux \
#   # substitute environment variables
#   && envsubst '$$DATA_DIR' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["nginx"]