FROM debian:buster

ADD https://deb.nodesource.com/setup_16.x node_setup
RUN set -eux \
  && bash node_setup

RUN set -eux \
  # update package index
  && apt-get update \
  # install nodejs
  && apt-get install -y nodejs

ADD https://github.com/sebastienwae/debugging-42/archive/main.tar.gz debugging-42.tar.gz
RUN set -eux \
  && tar xvfz debugging-42.tar.gz \
  && mv debugging-42-main static.42.fr \
  && rm -f debugging-42.tar.gz

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["static"]