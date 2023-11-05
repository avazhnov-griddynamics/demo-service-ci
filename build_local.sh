#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

docker build --file Dockerfile_devuan --tag 'python-flask-hello:devuan' .
docker tag 'python-flask-hello:devuan' 'python-flask-hello:latest'
# minikube image load 'python-flask-hello:latest'
