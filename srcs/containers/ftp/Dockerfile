FROM debian:buster

ARG DATA_DIR
ENV DATA_DIR=$DATA_DIR

RUN set -eux \
  # update package index
  && apt-get update \
  # install vsftp
  && apt-get install -y vsftpd \
  # create ftp user
  && adduser --gecos "" --disabled-password --home $DATA_DIR --no-create-home --ingroup www-data swaegene \
  # create emtpy chroot dir
  && mkdir -p /var/run/vsftpd/empty

# copy the vsftpd config
COPY vsftpd.conf /etc/vsftpd.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR $DATA_DIR

CMD ["ftp"]