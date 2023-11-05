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

## Argo CD

Install Argo CD.

Install the Python Flask app

```sh
argocd app create 'python-flask-hello-argo-app' \
  --repo https://github.com/avazhnov-griddynamics/demo-service-ci.git \
  --path helm-chart \
  --helm-set replicaCount=2 \
  --dest-namespace python-flask-hello-argo \
  --dest-name minikube
argocd app sync 'python-flask-hello-argo-app'
```

```sh
kubectl apply -n argocd -f Argo_CD/ApplicationSet_FairwindsOps.yaml
```

## How to

Check the Ingress works:

```sh
curl -H "Host: python-flask-hello.example.com" "http://$(minikube ip)/user/123"
```

## Known issues

The Helm Chart can't be installed multiple times (for example, into different namespaces) because of hardcoded `host` in Ingress rules.

## TODO

* [x] <del>pass kill signall from outside (for example, from `docker stop my-hello-app01`) to the app.</del>
  Works fine with `CMD = ["flask", "run", "-p", "8080", "-h", "::"]`, but not with `CMD ["/bin/bash", "./run_server.sh"]`.
* [x] <del>Check logs are writing</del>.
* [x] <del>Add healthchecks</del>.
* [ ] Support tags for deployment (to be able deploy not only `:latest`).
* [ ] Use WSGI server (`gunicorn` / `uwsgi` + `nginx`) for Production.
* [ ] Full templating of Helm chart, including `host` in Ingress.
* [ ] Auto cleanup old images from GitHub container registry.
