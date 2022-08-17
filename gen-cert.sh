#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "no username supplied"
else 
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$1".42.fr.key \
    -out "$1".42.fr.crt \
    -subj "/CN=$1.42.fr"
fi