dev-up:
	docker-compose -f docker-compose.dev.yml up --build
dev-down:
	docker-compose -f docker-compose.dev.yml down $(args)
dev-shell:
	docker-compose -f docker-compose.dev.yml run --rm app /bin/bash
dev-migrations:
	docker-compose -f docker-compose.dev.yml run --rm app \
	/bin/bash -c "python src/manage.py makemigrations $(app)"
dev-migrate:
	docker-compose -f docker-compose.dev.yml run --rm app \
	/bin/bash -c "python src/manage.py migrate $(app)"
