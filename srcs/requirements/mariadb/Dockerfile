FROM debian:buster

RUN set -eux \
  # update the packages & install mariadb
  && apt update && apt -y install gosu mariadb-server \
  && mkdir /var/run/mysqld \
  && chown -R mysql:mysql /var/run/mysqld

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

ENV MARIADB_ROOT_PASSWORD=hello123
ENV ADMIN_USERNAME=swaegene
ENV ADMIN_PASSWORD=hello123

CMD ["mysqld"]