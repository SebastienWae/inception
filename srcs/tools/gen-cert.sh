#!/usr/bin/env bash

mkdir -p srcs/secrets

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "srcs/secrets/swaegene".42.fr.key \
  -out "srcs/secrets/swaegene".42.fr.crt \
  -subj "/CN=swaegene.42.fr"