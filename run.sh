#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

docker run -d -p 8080:8080 --name python-flask-hello01 --rm --memory 128m python-flask-hello
