#!/usr/bin/env bash

if [ "$1" = 'ftp' ]; then
  if [ ! -f "$DATA_DIR/.vsftpd" ]; then
    chpasswd <<<"swaegene:$(< /run/secrets/ftp_password)"
    echo swaegene > /etc/vsftpd.userlist
    touch $DATA_DIR/.vsftpd
  fi

  exec vsftpd /etc/vsftpd.conf
fi

exec "$@"