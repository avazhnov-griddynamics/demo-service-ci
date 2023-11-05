#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

docker build --file Dockerfile_alpine --tag 'python-flask-hello:alpine' .
docker tag 'python-flask-hello:alpine' 'python-flask-hello:latest'
# minikube image load 'python-flask-hello:latest'
