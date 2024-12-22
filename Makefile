
DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RED = \033[0;31m
RESET = \033[0m

all: up

up:
	@echo "$(BLUE)Creating necessary directories...$(RESET)"
	@mkdir -p ~/data/db/
	@mkdir -p ~/data/wp/
	@echo "$(GREEN)Starting Docker containers...$(RESET)"
	$(DOCKER_COMPOSE) up --detach --build

down:
	@echo "$(YELLOW)Stopping and removing containers, volumes, and data...$(RESET)"
	@$(DOCKER_COMPOSE) down --volumes
	@echo "$(RED)Removing database and WordPress data...$(RESET)"
	@sudo rm -rf ~/data/db/*
	@sudo rm -rf ~/data/wp/*

stop:
	@echo "$(YELLOW)Stopping Docker containers...$(RESET)"
	@$(DOCKER_COMPOSE) stop

start:
	@echo "$(GREEN)Starting Docker containers...$(RESET)"
	@$(DOCKER_COMPOSE) start

clean:
	@echo "$(RED)Cleaning up all containers, images, and volumes...$(RESET)"
	@$(DOCKER_COMPOSE) down --rmi all --volumes
	@echo "$(RED)Removing all database and WordPress data...$(RESET)"
	@sudo rm -rf ~/data/db/*
	@sudo rm -rf ~/data/wp/*

re: clean up

.PHONY: up down stop start clean
