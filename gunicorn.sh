#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/django-cicd/app

python3 manage.py makemigrations

python3 manage.py migrate

echo "Migrations Completed!"

cd /var/lib/jenkins/workspace/django-cicd/

# python3 manage.py collectstatic --noinput

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl status gunicorn

sudo systemctl restart gunicorn