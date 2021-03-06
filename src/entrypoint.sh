#!/bin/bash

# python /src/manage.py makemigrations 
# python /src/manage.py migrate --noinput

#psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'my_db'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE my_db"

[ ! -f /src/secret_key.txt ] && python /src/generate_key.py /src/secret_key.txt

echo "starting !!!!!!!!!!!"
su-exec ${APP_USER} python /src/manage.py makemigrations
su-exec ${APP_USER} python /src/manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.filter(email='admin@example.com').delete(); User.objects.create_superuser('admin', 'admin@example.com', '${ADMIN_PASS}')" | su-exec ${APP_USER} python manage.py shell
su-exec ${APP_USER} python /src/manage.py runserver 0.0.0.0:8000
