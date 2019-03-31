FROM debian:stretch

LABEL maintainer = "Mikhail Makarov <mikhail@makarov.us>"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y uwsgi
RUN apt-get install -y uwsgi-plugin-python3

RUN pip3 install virtualenv
RUN mkdir -p /var/www/django_project
WORKDIR /var/www/django_project
COPY requirements.txt /var/www/django_project
RUN virtualenv -p /usr/bin/python3 venv
RUN . venv/bin/activate && pip3 install -r requirements.txt

# For production
CMD uwsgi --ini /var/www/django_project/deploy/uwsgi.ini

# For developing
#CMD . venv/bin/activate && python3 /var/www/django_project/project/manage.py runserver 0.0.0.0:8000
