USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-setup: development-setup-env app-build
	docker-compose run --user=$(USER) app bin/setup


development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv
