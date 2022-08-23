FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install utilities
  && apt-get install -y gosu \
  # install mariadb
  && apt-get install -y mariadb-server \
  # create mariadb run directory
  && mkdir /var/run/mysqld \
  && chown -R mysql:mysql /var/run/mysqld

# copy the mariadb config
COPY --chown=myslq server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# copy healthcheck script
COPY healthcheck.sh /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["mariadb"]