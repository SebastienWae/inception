DOCKER_COMPOSE = docker-compose --file srcs/docker-compose.yml

all:
	$(DOCKER_COMPOSE) up -d --build

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