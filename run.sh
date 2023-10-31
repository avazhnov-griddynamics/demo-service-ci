#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
shopt -s dotglob

docker run -d -p 8080:8080 --name my-hello-app01 my-hello-app
