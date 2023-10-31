FROM registry.gitlab.com/vazhnov/devuan-docker-images/devuan_5_daedalus_python:latest

ENV DEBIAN_FRONTEND noninteractive
RUN set -x; apt-get update ; apt-get -V -y --no-install-recommends install python3-flask ; rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 8080

ENV FLASK_DEBUG=1
ENV FLASK_APP=flask-hello-app.py

# CMD ["/bin/bash", "./my-hello-app/run_server.sh"]
ENTRYPOINT [ "python3" ]
CMD ["flask", "run", "-p", "8080", "-h", "::"]
