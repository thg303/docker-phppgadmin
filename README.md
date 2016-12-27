Docker image of phppgadmin for local development use
===========

## Environment variables
	PORT=80 # running port of web server
	DB_HOST=db # database host
	DB_PORT=5432 # dabase port

## Run container
	$ docker run -ti -d -p 8080:80 --link postgres:db keepitcool/phppgadmin

Trying the browser on url http://localhost:8080.

You can override var env
	$ docker run -ti -d -p 8080:80 -e DB_HOST=postgres -e DB_PORT=5435 keepitcool/phppgadmin