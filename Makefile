# Makefile
# Load environment variables based on RAILS_ENV
include .env

ifeq ($(RAILS_ENV),production)
	include .env.prod
else
	include .env.dev
endif

# Export variables from the included file
export $(shell sed 's/=.*//' .env.prod .env.dev | uniq)


# =============================
# Build dependencies
# =============================
init:
ifeq ($(RAILS_ENV),production)
	@echo "Building production container..."
	@if [ -d tmp ]; then rake tmp:cache:clear; fi
	docker compose -f docker-compose.prod.yml build
else
	@echo "Building development container..."
	@if [ -d tmp ]; then rake tmp:cache:clear; fi
	docker compose -f docker-compose.dev.yml build
endif

prepare:
	@if [ -d tmp ]; then rake tmp:cache:clear; fi
	rake tmp:cache:clear
	rake tmp:clear

start:
ifeq ($(RAILS_ENV),production)
	@echo "Starting production container..."
	docker compose -f docker-compose.prod.yml up -d
else
	@echo "Starting development container..."
	docker compose -f docker-compose.dev.yml up
endif

stop:
ifeq ($(RAILS_ENV),production)
	@echo "Stopping production container..."
	docker compose -f docker-compose.prod.yml down
else
	@echo "Stopping development container..."
	docker compose -f docker-compose.dev.yml down
endif

mig:
ifeq ($(RAILS_ENV),production)
	docker compose -f docker-compose.prod.yml run cloudcine-web rails db:migrate RAILS_ENV=production
else
	docker compose -f docker-compose.dev.yml run cloudcine-web rails db:migrate RAILS_ENV=development
endif

# Console commands
bash:
	docker exec -it cloudcine-app bash

console:
	rails console

logs:
	docker logs -f cloudcine-app

# Clean code
clean:
ifeq ($(RAILS_ENV),production)
	docker compose -f docker-compose.prod.yml run cloudcine-web rubocop -A
else
	docker compose -f docker-compose.dev.yml run cloudcine-web rubocop -A
endif

# Create admin for Dashboard
create_admin:
ifeq ($(RAILS_ENV),production)
	docker compose -f docker-compose.prod.yml run cloudcine-web rake admin:create[$(email),$(password)] RAILS_ENV=production
else
	docker compose -f docker-compose.dev.yml run cloudcine-web rake admin:create[$(email),$(password)] RAILS_ENV=development
endif

# =============================
# Create dependencies
# Control Rails generated stuff
# =============================
# Usage: make controller name=<name>
controller:
ifeq ($(RAILS_ENV),production)
	docker compose -f docker-compose.prod.yml run cloudcine-web rails g stimulus $(name)
else
	docker compose -f docker-compose.dev.yml run cloudcine-web rails g stimulus $(name)
endif