Based on https://gitlab.com/vazhnov/gnss-web-control (Python, MIT license).

## TODO

* pass kill signall from outside (for example, from `docker stop my-hello-app01`) to the app.
  Works fine with `CMD = ["flask", "run", "-p", "8080", "-h", "::"]`, but not with `CMD ["/bin/bash", "./run_server.sh"]`.
* logs
