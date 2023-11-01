#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

docker build -t 'python-flask-hello:latest' .
# minikube image load python-flask-hello
