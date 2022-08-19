FROM debian:buster

RUN set -eux \
    # update package index
    && apt update \
    # install utilities
    && apt install -y gettext-base gosu \
    # install mariadb
    && apt install mariadb-server \
    # create mariadb socket directory
    && mkdir /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

# copy the mariadb config
COPY --chown=myslq server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN set -eux \
    # substitute environment variables
    && envsubst '${LOGIN_42}' < /etc/mysql/mariadb.conf.d/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR ${DATA_DIR}

CMD mariadb