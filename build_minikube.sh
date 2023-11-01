#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

minikube image build -t 'python-flask-hello:latest' .
