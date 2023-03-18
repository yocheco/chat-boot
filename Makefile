# 🐳 Docker Compose prod
build: CMD=build --pull --force-rm --no-cache
up: CMD=up -d
stop: CMD=stop
down: CMD=down

build up stop down:
	@docker-compose $(CMD)

rebuild:
	make build
	make down
	make up

restart:
	make stop
	make down
	make up

deploy:
	make rebuild
	yes y | docker system prune -a


dev:
	@docker-compose -f ./services/mongo/docker-compose.yml up -d
	@npm start --prefix ./src

dev-down:
	@docker-compose -f ./services/mongo/docker-compose.yml down