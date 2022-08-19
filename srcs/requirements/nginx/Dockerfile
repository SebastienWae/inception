FROM debian:buster

RUN set -eux \
    # create user first for consistency
    && addgroup --system --gid 101 www-data \
    && adduser --system --disabled-login --ingroup www-data --no-create-home --home /nonexistent --gecos "www-data user" --shell /bin/false --uid 101 www-data \
    # update package index
    && apt update \
    # install utilities
    && apt install -y gettext-base gosu \
    # install nginx
    && apt install nginx \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# copy the nginx config
COPY --chown=www-data nginx.conf /etc/nginx

RUN set -eux \
    # substitute environment variables
    && envsubst '${DATA_DIR}' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR ${DATA_DIR}

CMD nginx