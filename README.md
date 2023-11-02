Based on https://gitlab.com/vazhnov/gnss-web-control (Python, MIT license).

## minikube

Prepare minikube:

```sh
minikube addons enable ingress
bash ./build_minikube.sh
```

## How to

Check the Ingress works:

```sh
curl -H "Host: python-flask-hello.example.com" "http://$(minikube ip)/user/123"
```

## TODO

* <del>pass kill signall from outside (for example, from `docker stop my-hello-app01`) to the app.</del>
  Works fine with `CMD = ["flask", "run", "-p", "8080", "-h", "::"]`, but not with `CMD ["/bin/bash", "./run_server.sh"]`.
* <del>logs</del>.
* support tags for deployment (to be able deploy not only `:latest`).
* healthchecks
* use WSGI server (`gunicorn` / `uwsgi` + `nginx`) for Production
