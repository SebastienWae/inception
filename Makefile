DOCKER_COMPOSE = docker compose --file srcs/docker-compose.yml

all: gen-certs gen-pass
	$(DOCKER_COMPOSE) up -d --build

up:
	$(DOCKER_COMPOSE) up

build:
	$(DOCKER_COMPOSE) build --no-cache

nginx:
	$(DOCKER_COMPOSE) build --no-cache nginx

wordpress:
	$(DOCKER_COMPOSE) build --no-cache wordpress

mariadb:
	$(DOCKER_COMPOSE) build --no-cache mariadb

redis:
	$(DOCKER_COMPOSE) build --no-cache redis

ftp:
	$(DOCKER_COMPOSE) build --no-cache ftp

down:
	$(DOCKER_COMPOSE) down -v

clean: down
	docker volume prune --force

prune: clean
	docker system prune --force --volumes

secrets:
	./srcs/tools/gen-cert.sh
	./srcs/tools/gen-pass.sh