FROM debian:buster

RUN set -x \
    # update the packages & install nginx
    && apt update && apt install -y nginx \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# copy the nginx config
COPY nginx.conf /etc/nginx

# copy the SSL certificate
COPY --chown=www-data *.42.fr* /etc/nginx/ssl/

# start nginx
CMD nginx -g "daemon off;"