# Basic Helm deployment

A self-contained .NET 8 API packaged as a Helm chart for local Docker Desktop Kubernetes.

The chart creates:

- an API Deployment with 2 replicas by default;
- a local `LoadBalancer` Service; and
- an optional Horizontal Pod Autoscaler.

## Prerequisites

- Docker Desktop with **Kubernetes enabled**
- `kubectl`
- [Helm](https://helm.sh/docs/intro/install/)
- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) for running outside Docker

Confirm that the local cluster is available:

```sh
kubectl config use-context docker-desktop
kubectl cluster-info
```

## Build the local image

Run from this example's `25` directory:

```sh
docker build -f src/Api/Dockerfile -t helm-api:local .
```

`chart/values.yaml` sets `imagePullPolicy: Never`, so Docker Desktop Kubernetes uses this local image rather than pulling from a registry.

## Validate the chart

```sh
helm lint chart
helm template local-api chart
```

## Install locally

```sh
helm upgrade --install local-api chart
kubectl rollout status deployment/local-api-basic-api
kubectl get pods,services
```

Open <http://localhost/>. If Docker Desktop does not bind the LoadBalancer to localhost, forward the Helm-managed Service instead:

```sh
kubectl port-forward service/local-api-basic-api 8080:80
```

Then open <http://localhost:8080/>.

## Configure the release

Override the default replica count without editing the chart:

```sh
helm upgrade local-api chart --set replicaCount=3
```

Enable the optional HPA:

```sh
helm upgrade local-api chart \
  --set autoscaling.enabled=true \
  --set autoscaling.minReplicas=2 \
  --set autoscaling.maxReplicas=10
```

HPA requires Kubernetes Metrics Server. Check availability with:

```sh
kubectl top pods
```

Docker Desktop may not install Metrics Server by default. Keep autoscaling disabled, as it is in `values.yaml`, when Metrics Server is unavailable.

View the release and rendered values:

```sh
helm list
helm get manifest local-api
helm get values local-api
```

## Uninstall

```sh
helm uninstall local-api
```
