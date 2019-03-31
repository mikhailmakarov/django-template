#!/usr/bin/env bash
cd /var/www/django_project
. venv/bin/activate
pip3 install -r ./requirements.txt
python3 ./project/manage.py migrate
python3 ./project/manage.py collectstatic --noinput
