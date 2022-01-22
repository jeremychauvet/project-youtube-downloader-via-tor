.PHONY: validate build test

validate:
	pre-commit run --all-files

build:
	docker build -t youtube-dl-via-tor:latest .

test:
	docker run --rm youtube-dl-via-tor:latest tail -f /dev/null
