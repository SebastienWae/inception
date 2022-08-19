FROM debian:buster

ARG DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gettext-base gosu \
  # install mariadb
  && apt-get install -y mariadb-server \
  # create mariadb socket directory
  && mkdir /var/run/mysqld \
  && chown -R mysql:mysql /var/run/mysqld

# copy the mariadb config
COPY --chown=myslq server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN set -eux \
  # substitute environment variables
  && envsubst '$$DATA_DIR' < /etc/mysql/mariadb.conf.d/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR ${DATA_DIR}

CMD ["mariadb"]