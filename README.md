# Kubernetes examples

Small, independent examples ordered by increasing complexity. Every example is intended to be self-contained and runnable on Docker Desktop Kubernetes.

A checked item is currently implemented; unchecked items define the planned catalogue.

1. **[x] [`01`](01/): Beginner pods** — Runs an API and worker as Deployments, creates multiple pods, and exposes the API through a Service.
2. **[ ] `02-beginner-configmap`** — Injects one non-sensitive configuration value into an API.
3. **[ ] `03-beginner-secret`** — Injects one demonstration secret into a pod without putting it in the image.
4. **[ ] `04-beginner-health-probes`** — Shows startup, readiness, and liveness probes independently.
5. **[ ] `05-beginner-resource-limits`** — Demonstrates CPU and memory requests, limits, throttling, and out-of-memory failure.
6. **[ ] `06-beginner-init-and-sidecar`** — Uses an init container for setup and a sidecar alongside the application.
7. **[ ] `07-beginner-job`** — Runs a console application once and records its completion.
8. **[ ] `08-beginner-cronjob`** — Runs a console application repeatedly on a Kubernetes schedule.
9. **[ ] `09-intermediate-clusterip`** — Exposes an API only to workloads inside the cluster.
10. **[ ] `10-intermediate-nodeport`** — Exposes an API through a fixed port on the local Kubernetes node.
11. **[ ] `11-intermediate-loadbalancer`** — Exposes an API through Docker Desktop's local LoadBalancer integration.
12. **[ ] `12-intermediate-rolling-updates`** — Performs an image rollout, inspects its history, and rolls back a failed release.
13. **[ ] `13-intermediate-nginx-ingress`** — Installs NGINX Ingress and routes host and path traffic to an API.
14. **[ ] `14-intermediate-traefik-ingress`** — Implements equivalent local routing with Traefik and its configuration model.
15. **[ ] `15-intermediate-haproxy-ingress`** — Routes traffic through the HAProxy Kubernetes Ingress controller.
16. **[ ] `16-intermediate-kong-ingress`** — Uses Kong as an API gateway and applies one small gateway plugin.
17. **[ ] `17-intermediate-envoy-gateway`** — Installs Envoy Gateway and routes traffic with the Kubernetes Gateway API.
18. **[ ] `18-intermediate-gateway-routing`** — Focuses on `GatewayClass`, `Gateway`, and `HTTPRoute` host/path matching.
19. **[ ] `19-intermediate-tls`** — Terminates local HTTPS using a Kubernetes TLS Secret.
20. **[ ] `20-intermediate-service-calls`** — Has one API call another through a ClusterIP Service and Kubernetes DNS.
21. **[ ] `21-intermediate-persistent-volume`** — Writes data to a mounted volume and retains it after pod replacement.
22. **[ ] `22-intermediate-statefulset`** — Demonstrates stable pod identity, ordered deployment, and per-pod storage.
23. **[ ] `23-intermediate-metrics-server`** — Installs local resource metrics and verifies them with `kubectl top`.
24. **[x] [`24`](24/): Intermediate HPA** — Scales an API between 2 and 10 replicas based on average CPU utilization.
25. **[x] [`25`](25/): Intermediate Helm** — Packages an API Deployment, Service, and optional HPA as a configurable Helm release.
26. **[ ] `26-advanced-rbac`** — Gives a ServiceAccount the minimum permissions needed to read selected resources.
27. **[ ] `27-advanced-network-policy`** — Restricts which pods may communicate with an internal service.
28. **[ ] `28-advanced-pod-disruption-budget`** — Protects minimum availability during voluntary disruptions.
29. **[ ] `29-advanced-keda-worker`** — Scales a worker from queue depth instead of CPU utilization.
30. **[ ] `30-advanced-opentelemetry`** — Exports application traces and metrics to local observability tooling.
31. **[ ] `31-advanced-istio`** — Demonstrates service-mesh routing and telemetry with Istio.
32. **[ ] `32-advanced-linkerd`** — Demonstrates lightweight service-mesh traffic and telemetry with Linkerd.

Ingress controllers are intentionally separate: NGINX, Traefik, HAProxy, Kong, and Envoy use different controllers, annotations or APIs, and operational models.
