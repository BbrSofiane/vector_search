#!/bin/sh

tailwindcss -i vector_search/static/css/style.css -o vector_search/static/css/output.css --minify
python manage.py collectstatic --noinput
python manage.py migrate
python manage.py makesuperuser
gunicorn config.wsgi --config="docker/gunicorn.conf.py"
