#!/usr/bin/env bash

REDISCLI_AUTH=$(< /run/secrets/redis_password) redis-cli -h redis ping

exit $?