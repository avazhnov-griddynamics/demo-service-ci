#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

minikube image build --file Dockerfile_alpine --tag 'python-flask-hello:alpine' .
minikube image tag 'python-flask-hello:alpine' 'python-flask-hello:latest'
