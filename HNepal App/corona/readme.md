# Corona tracker api

## Introduction
Track users and basic corona information

## Pre-requisites
- python3.6+
- virtualenv
- git

## Setup (Linux)

- Clone repository:
	```bash
	git clone https://github.com/bishwo633/corona.git
	```

- Prepare environment:
	```bash
	cd corona
	virtualenv venv -p python3.6
	source venv/bin/activate
	pip install -r requirements.txt
	python manage.py migrate
	python manage.py makemigrations blood
	python manage.py migrate blood
	```

- Create superuser:
	```bash
	python manage.py createsuperuser
	```

- Run:
	```bash
	python manage.py runserver 8080
	```

- Verify:
	- http://localhost:8080
	- Admin: http://localhost:8080/admin
	- Api: http://localhost:8080/api/bloods/
		- List: GET http://localhost:8080/api/bloods/
		- Create: POST http://localhost:8080/api/bloods/
		- Get: GET http://localhost:8080/api/bloods/1
		- Update: PUT http://localhost:8080/api/bloods/1
		- Delete: DELETE http://localhost:8080/api/bloods/1

- Hurray !!!

