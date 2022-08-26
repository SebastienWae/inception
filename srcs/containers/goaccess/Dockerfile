FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  && apt-get update \
  && apt-get install -y wget gpg lsb-release \
  # add goaccess repo
  && wget -O - https://deb.goaccess.io/gnugpg.key | gpg --dearmor | tee /usr/share/keyrings/goaccess.gpg >/dev/null \
  && echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/goaccess.list \
  # update package index
  && apt-get update \
  # install goaccess
  && apt-get install -y goaccess

# copy goacess config file
COPY goaccess.conf /etc/goaccess/goaccess.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["goaccess"]