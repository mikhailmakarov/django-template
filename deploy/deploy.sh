#!/usr/bin/env bash
git pull
pip install -r requirements.txt
python3 manage.py migrate
python3 manage.py collectstatic --noinput
chown -R www-data:www-data ./project
service uwsgi reload
