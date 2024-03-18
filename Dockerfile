FROM python:3.12

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ARG TARGETARCH

# Set the working directory to /app
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client libpq-dev postgresql-contrib gnupg unixodbc-dev dialog

RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
RUN curl https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools18

# Copy only the requirements.in and .env.local files into the container
COPY requirements.in /app/

# Install pip-tools
RUN pip install --upgrade pip && \
    pip install pip-tools

# Compile requirements.in to requirements.txt and install pip requirements
RUN pip-compile requirements.in && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files into the container
COPY . /app/
RUN chmod +x manage.py

# Run collectstatic to gather static files
RUN python manage.py collectstatic --noinput

# Make port 8000 available to the world outside this container
EXPOSE 80

# Define the command to run your application
CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:80"]
