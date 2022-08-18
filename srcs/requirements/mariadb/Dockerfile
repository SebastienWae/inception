FROM debian:buster

RUN set -eux \
  # update the packages & install mariadb
  && apt update && apt -y install mariadb-server
  # secure installation
  # create wordpress database
  # create wordpress user

# "UPDATE mysql.user SET Password=PASSWORD('$esc_pass') WHERE User='root';"
#  do_query "DELETE FROM mysql.user WHERE User='';"
#   do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# do_query "DROP DATABASE test;"
# do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

# "CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\` ;"

# CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$userPasswordEscaped';
# "GRANT ALL ON \`${MARIADB_DATABASE//_/\\_}\`.* TO '$MARIADB_USER'@'%' ;"

#  do_query "FLUSH PRIVILEGES;"

CMD mariadb