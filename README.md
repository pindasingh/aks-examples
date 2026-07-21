# Basic .NET pods on Docker Desktop Kubernetes

A bare-bones Kubernetes example with:

- a minimal .NET 8 HTTP API running in two pods;
- a .NET 8 background worker running in one pod; and
- a `LoadBalancer` service exposing the API locally.

The manifests use standard Kubernetes resources and can later be adapted for AKS by publishing the images to a registry and changing the image names.

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) (only needed to build/run outside Docker)
- Docker Desktop with **Kubernetes enabled**
- `kubectl`

## Build the images

Run these commands from the repository root:

```sh
docker build -f src/Api/Dockerfile -t basic-api:local .
docker build -f src/Worker/Dockerfile -t basic-worker:local .
```

The manifests set `imagePullPolicy: Never`, so Docker Desktop uses these local images instead of a remote registry.

## Deploy locally

Select Docker Desktop's cluster, apply the manifests, and wait for the deployments:

```sh
kubectl config use-context docker-desktop
kubectl apply -f k8s/
kubectl rollout status deployment/api
kubectl rollout status deployment/worker
kubectl get pods,services
```

Open <http://localhost/>. The response includes the serving pod name; refreshing may show either API pod.

If the Docker Desktop load balancer does not bind port 80, use port forwarding instead:

```sh
kubectl port-forward service/api 8080:80
```

Then open <http://localhost:8080/>.

View the worker output:

```sh
kubectl logs deployment/worker --follow
```

## Clean up

```sh
kubectl delete -f k8s/
```

## Run without containers (optional)

```sh
dotnet run --project src/Api
dotnet run --project src/Worker
```
