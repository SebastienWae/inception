DOCKER_COMPOSE = docker compose --file srcs/docker-compose.yml

all: gen-certs gen-pass
	$(DOCKER_COMPOSE) up -d --build

cert:
	./srcs/tools/gen-cert.sh

pass:
	./srcs/tools/gen-pass.sh

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

clean: down
	docker volume prune --force