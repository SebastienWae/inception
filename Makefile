DOCKER_COMPOSE = docker-compose --file srcs/docker-compose.yml

all: gen-certs gen-env
	$(DOCKER_COMPOSE) up -d --build

cert:
	./gen-cert.sh

env:
	./gen-env.sh
	@cat srcs/.env-admin
	@cat srcs/.env-mariadb
	@cat srcs/.env-user

up:
	$(DOCKER_COMPOSE) up -d

up_dev:
	$(DOCKER_COMPOSE) up --force-recreate

build:
	$(DOCKER_COMPOSE) build

build_dev:
	$(DOCKER_COMPOSE) build --no-cache

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) rm --force