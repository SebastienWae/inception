FROM debian:buster

RUN set -x \
    # create nginx user and group
    && addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
    # update the packages & install nginx
    && apt-get update && apt-get install -y nginx \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    # delete the default nginx config
    && rm /etc/nginx/nginx.conf

# copy the nginx config
COPY nginx.conf /etc/nginx

# TODO: set permissions
# copy the SSL certificate
COPY --chown=nginx ssl/${USER}.42.fr.* /etc/nginx/ssl

# start nginx
CMD nginx -g "daemon off;"