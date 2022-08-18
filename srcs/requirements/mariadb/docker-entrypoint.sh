#!/usr/bin/env bash

do_query() {
  mariadb --protocol=socket -uroot -hlocalhost  <<< "$@"
}

if [ "$1" = 'mysqld' ]; then
  # if container is started as root user, restart as dedicated mysql user
  if [ "$(id -u)" = "0" ]; then
    echo "Switching to dedicated user 'mysql'"
    exec gosu mysql "${BASH_SOURCE[0]}" "$@"
  fi

  # start temporary server for bootstrapping
  mysqld --skip-networking --default-time-zone=SYSTEM --wsrep_on=OFF \
		--expire-logs-days=0 --loose-innodb_buffer_pool_load_at_startup=0 &

  # TODO
  # wait for server to start
  sleep 10

  # change root password
  do_query "UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User='root';"

  # delete remote root user
  do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

  # delete anonymous users
  do_query "DELETE FROM mysql.user WHERE User='';"

  # # drop test database
  do_query "DROP DATABASE IF EXISTS test;"
  do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

  # create wordpress database
  do_query "CREATE DATABASE IF NOT EXISTS wordpress;"

  # create wordpress user
  do_query "CREATE USER '$ADMIN_USERNAME'@'%' IDENTIFIED BY '$ADMIN_PASSWORD';"
  do_query "GRANT ALL ON wordpress.* TO '$ADMIN_USERNAME'@'%' ;"

  # apply changes
  do_query "FLUSH PRIVILEGES;"

  # stop temporary server
  mysqladmin shutdown -uroot
fi
# start server as normal
exec "$@"




