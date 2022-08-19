FROM debian:buster

RUN set -eux \
    # update the packages & install gosu, envsubst, mariadb
    && apt update && apt install -y gettext-base gosu mariadb-server \
    # create mariadb socket directory
    && mkdir /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

# copy the mariadb config
COPY server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN set -eux \
    # substitute environment variables
    && envsubst '${LOGIN_42}' < /etc/mysql/mariadb.conf.d/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD mariadb