# Getting Started with Django

[![Deploy to Divio](https://img.shields.io/badge/DEPLOY-TO%20DIVIO-DFFF67?logo=docker&logoColor=white&labelColor=333333)](https://control.divio.com/app/new/?template_url=https://github.com/divio/getting-started-with-django/archive/refs/heads/main.zip)

Welcome to our QuickStart template – your portal to swift application development and seamless local testing. Whether you're delving into Django for the first time or optimizing your workflow, our template, based on Djangos' [Getting started](https://docs.djangoproject.com/en/5.0/intro/) guide, has got you covered.

## Cloud Setup

Create a [Divio Account](https://control.divio.com/) and choose **Django** from the template selection when creating a new application. Alternatively, click the `Deploy to Divio` button above and follow the app creation wizard. Finally, deploy your app to the `test` or `live` environment.

Beware that the **admin** user is not created automatically.
You can do so by connecting via SSH and manually run `python manage.py createsuperuser`.

For in-depth details about Divio Cloud, refer to the [Divio documentation](https://docs.divio.com/introduction/).

## Local Setup

Install the [Divio CLI](https://github.com/divio/divio-cli) to set up your app locally.

Alternatively, build this app locally using Docker:

1. Ensure [Docker](https://docs.docker.com/get-docker/) is installed and running.
2. Clone this repository locally.
3. Build the app with `docker compose build`.
4. Run the migrations with `docker compose run --rm web python manage.py migrate`
5. Create a superuser with `docker compose run --rm web python manage.py createsuperuser`
6. Run the app using `docker compose up`.
7. Open [http://localhost:8000]() to view your app.
