# Django Template Project

This is a sample repository for starting django project. I collected some features and software stack.
It uses:

* Django
* uwsgi
* nginx
* PostgreSQL
* Env file for database credentials and for hiding django secret key from a repository to environment variable
* Docker for developing and production deploying
* Common logs folder for keeping in one place

## How to use it
0. git clone git@github.com:mikhailmakarov/django-template.git .
1. cp .env_example .env
2. Specify secret key in .env file
3. docker-compose up
4. Open connection to uwsgi container and apply deployment script for django

	0. Open a new terminal
	1. docker ps
	2. docker exec -it <place your container hash> /bin/bash
	3. sh deploy/deploy.sh
	4. . venv/bin/activate && python3 project/manage.py createsuperuser
	5. exit
5. Now you can pass to url: http://127.0.0.1/admin/

## Developing
For developing you can uncomment two lines in Dockerfile and docker-compose.yml. It will open 8000 port and run django native server. Also use DEBUG=True in .env file for debugging.
