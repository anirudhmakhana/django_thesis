#!/bin/sh

sudo cp -rf app.conf /etc/nginx/conf.d
chmod 705 /var/lib/jenkins/workspace/django-cicd

sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx

echo "Nginx has started."

sudo systemctl enable nginx

echo "Nginx has been enabled."

sudo systemctl status nginx

sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'