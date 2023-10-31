# The resulting size is about 236MB. The original image, "devuan_5_daedalus_python", is 156MB.
FROM registry.gitlab.com/vazhnov/devuan-docker-images/devuan_5_daedalus_python:latest

MAINTAINER Alexey Vazhnov "avazhnov@griddynamics.com"
LABEL app=python-flask-hello

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get -V -y --no-install-recommends install python3-flask \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /app
COPY ./my-hello-app /app

USER nobody
EXPOSE 8080
ENV FLASK_DEBUG=1
ENV FLASK_APP=flask-hello-app.py

# CMD ["/bin/bash", "./run_server.sh"]
CMD ["flask", "run", "-p", "8080", "-h", "::"]
