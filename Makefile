DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all : up

up:
	mkdir -p ~/data/db/
	mkdir -p ~/data/wp/
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down --volumes
	sudo rm -rf ~/data/db/*
	sudo rm -rf ~/data/wp/*
stop:
	$(DOCKER_COMPOSE) stop
start:
	$(DOCKER_COMPOSE) start
clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes
	sudo em -rf ~/data/db/*
	sudo em -rf ~/data/wp/*
re : clean up

.PHONY: up down stop start clean