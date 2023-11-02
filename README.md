Test task.

Based on https://gitlab.com/vazhnov/gnss-web-control (Python, MIT license).

## GitHub actions requirements

A personal access token have to be created and stored into `secrets.PERSONAL_ACCESS_TOKEN_CONTAINER_REGISTRY` for GitHub actions workflow to be able to push container images into https://github.com/avazhnov-griddynamics/demo-service-ci/pkgs/container/python-flask-hello

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

* [x] <del>pass kill signall from outside (for example, from `docker stop my-hello-app01`) to the app.</del>
  Works fine with `CMD = ["flask", "run", "-p", "8080", "-h", "::"]`, but not with `CMD ["/bin/bash", "./run_server.sh"]`.
* [x] <del>Check logs are writing</del>.
* [x] <del>Add healthchecks</del>.
* [ ] Support tags for deployment (to be able deploy not only `:latest`).
* [ ] Use WSGI server (`gunicorn` / `uwsgi` + `nginx`) for Production.
* [ ] Full templating of Helm chart.
* [ ] Auto cleanup old images from GitHub container registry.
