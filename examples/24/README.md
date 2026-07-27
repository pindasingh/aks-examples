# Basic Horizontal Pod Autoscaler

A self-contained .NET 8 API demonstrating CPU-based Kubernetes horizontal pod autoscaling.

The API starts with **2 pods**. Its Horizontal Pod Autoscaler (HPA) keeps at least 2 pods and can scale out to 10 when average CPU utilization exceeds 70%.

## Prerequisites

- Docker Desktop with **Kubernetes enabled**
- `kubectl`
- Kubernetes Metrics Server (included in many Docker Desktop Kubernetes installations)
- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) for running outside Docker

Check that pod metrics are available:

```sh
kubectl top pods
```

If the Metrics API is unavailable, install or enable Metrics Server for the local cluster first.

## Build the image

Run from this example's `24` directory:

```sh
docker build -f src/Api/Dockerfile -t hpa-api:local .
```

The manifest uses `imagePullPolicy: Never` so Docker Desktop uses the local image.

## Deploy

```sh
kubectl config use-context docker-desktop
kubectl apply -f k8s/
kubectl rollout status deployment/api
kubectl get pods
kubectl get hpa
```

The deployment's `replicas: 2` creates the initial pods. Once active, the HPA's `minReplicas: 2` controls the minimum. Change `maxReplicas` in `k8s/hpa.yaml` to configure the maximum number of instances.

## Watch scaling

In one terminal, watch utilization and pod counts:

```sh
kubectl get hpa,pods --watch
```

In another terminal, forward the API and generate requests:

```sh
kubectl port-forward service/api 8080:80
```

PowerShell load loop:

```powershell
1..20 | ForEach-Object { Start-Job { while ($true) { Invoke-WebRequest http://localhost:8080/ -UseBasicParsing | Out-Null } } }
```

Stop the load jobs with:

```powershell
Get-Job | Stop-Job
Get-Job | Remove-Job
```

Scale-down is gradual and may take several minutes after load stops.

## Clean up

```sh
kubectl delete -f k8s/
```
