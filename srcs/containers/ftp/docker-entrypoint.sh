#!/usr/bin/env bash

if [ "$1" = 'ftp' ]; then
  # set ftp user password
  chpasswd <<<"swaegene:$(< /run/secrets/ftp_password)"

  # add user to allowed list
  echo swaegene > /etc/vsftpd.userlist

  # add passive address
  echo "pasv_address= $(/sbin/ip route|awk '/default/ { print $3 }')" >> /etc/vsftpd.conf

  # start ftp server
  exec vsftpd /etc/vsftpd.conf
fi

exec "$@"