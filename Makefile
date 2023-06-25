PROJECT_NAME := inception
PROJECT_DIRECTORY := srcs/requirements
COMPOSE_FILE := srcs/docker-compose.yml
ENVIRONMENT_FILE := srcs/.env

COMPOSE_FLAGS := --project-name $(PROJECT_NAME) --project-directory $(PROJECT_DIRECTORY) --file $(COMPOSE_FILE) --env-file $(ENVIRONMENT_FILE)

.PHONY : all clean re up down top config init

all :
	@make up

clean :
	@make down

re :
	@make down
	@make up

up:
	@docker-compose $(COMPOSE_FLAGS) up --build --detach

down:
	@docker-compose $(COMPOSE_FLAGS) down --rmi all --volumes

top :
	@docker-compose $(COMPOSE_FLAGS) top

config :
	@docker-compose $(COMPOSE_FLAGS) config

init :
	srcs/requirements/tools/init-environments.sh
