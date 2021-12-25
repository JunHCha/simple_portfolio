#!/bin/bash

poetry install --no-interaction --no-ansi

cd src
python manage.py collectstatic --noinput
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8000
