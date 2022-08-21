#!/usr/bin/env bash

mkdir -p srcs/secrets

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "srcs/secrets/$USER".42.fr.key \
  -out "srcs/secrets/$USER".42.fr.crt \
  -subj "/CN=$USER.42.fr"