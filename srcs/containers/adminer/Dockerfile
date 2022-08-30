FROM debian:buster

ARG DATA_DIR

ADD --chown=www-data:www-data https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php adminer.php

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["adminer"]