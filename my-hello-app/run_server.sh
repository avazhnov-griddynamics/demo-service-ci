#!/usr/bin/env bash

export FLASK_DEBUG=1
export FLASK_APP='flask-hello-app.py'

# :: — listen both IPv4 + IPv6 (in Linux, this depends on sysctl option `net.ipv6.bindv6only`)
flask run -p 8080 -h ::
