.PHONY: install
install:
	cp .env.example .env
	docker-compose up -d --build
	docker-compose exec laravel-sample-app npm update
	docker-compose exec laravel-sample-app composer install
	docker-compose exec laravel-sample-app php artisan key:generate
	docker-compose exec laravel-sample-app php artisan migrate
	docker-compose exec laravel-sample-app npm run build
	docker-compose exec laravel-sample-app npm run dev

.PHONY: start
start:
	docker-compose up -d
	docker-compose exec laravel-sample-app php artisan key:generate
	docker-compose exec laravel-sample-app npm run build
	docker-compose exec laravel-sample-app npm run dev
