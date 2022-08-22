#!/usr/bin/env bash

MYSQL_PWD=$(< /run/secrets/mariadb_wordpress_password) mysqladmin ping --silent -uwordpress -hmariadb --protocol=tcp --port=3306

exit $?