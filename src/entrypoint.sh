#!/bin/bash

# python /src/manage.py makemigrations 
# python /src/manage.py migrate --noinput

[ ! -f /src/secret_key.txt ] && python /src/generate_key.py /src/secret_key.txt

echo "starting !!!!!!!!!!!"
su-exec ${APP_USER} python /src/manage.py runserver 0.0.0.0:8000