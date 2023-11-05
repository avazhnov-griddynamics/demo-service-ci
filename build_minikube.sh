#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

minikube image build --file Dockerfile_devuan --tag 'python-flask-hello:devuan' .
minikube image tag 'python-flask-hello:devuan' 'python-flask-hello:latest'
