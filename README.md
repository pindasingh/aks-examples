# Kubernetes examples

Small, independent examples ordered by increasing complexity. Every example is intended to be self-contained and runnable on Docker Desktop Kubernetes.

A checked item is currently implemented; unchecked items define the planned catalogue.

1. **[x] [`01`](examples/01/): Beginner: Pods** — Runs an API and worker as Deployments, creates multiple pods, and exposes the API through a Service.
2. **[ ] [`02`](examples/02/): Beginner: ConfigMap** — Injects one non-sensitive configuration value into an API.
3. **[ ] [`03`](examples/03/): Beginner: Secret** — Injects one demonstration secret into a pod without putting it in the image.
4. **[ ] [`04`](examples/04/): Beginner: Health Probes** — Shows startup, readiness, and liveness probes independently.
5. **[ ] [`05`](examples/05/): Beginner: Resource Limits** — Demonstrates CPU and memory requests, limits, throttling, and out-of-memory failure.
6. **[ ] [`06`](examples/06/): Beginner: Init And Sidecar** — Uses an init container for setup and a sidecar alongside the application.
7. **[ ] [`07`](examples/07/): Beginner: Job** — Runs a console application once and records its completion.
8. **[ ] [`08`](examples/08/): Beginner: CronJob** — Runs a console application repeatedly on a Kubernetes schedule.
9. **[ ] [`09`](examples/09/): Intermediate: ClusterIP** — Exposes an API only to workloads inside the cluster.
10. **[ ] [`10`](examples/10/): Intermediate: NodePort** — Exposes an API through a fixed port on the local Kubernetes node.
11. **[ ] [`11`](examples/11/): Intermediate: LoadBalancer** — Exposes an API through Docker Desktop's local LoadBalancer integration.
12. **[ ] [`12`](examples/12/): Intermediate: Rolling Updates** — Performs an image rollout, inspects its history, and rolls back a failed release.
13. **[ ] [`13`](examples/13/): Intermediate: NGINX Ingress** — Installs NGINX Ingress and routes host and path traffic to an API.
14. **[ ] [`14`](examples/14/): Intermediate: Traefik Ingress** — Implements equivalent local routing with Traefik and its configuration model.
15. **[ ] [`15`](examples/15/): Intermediate: HAProxy Ingress** — Routes traffic through the HAProxy Kubernetes Ingress controller.
16. **[ ] [`16`](examples/16/): Intermediate: Kong Ingress** — Uses Kong as an API gateway and applies one small gateway plugin.
17. **[ ] [`17`](examples/17/): Intermediate: Envoy Gateway** — Installs Envoy Gateway and routes traffic with the Kubernetes Gateway API.
18. **[ ] [`18`](examples/18/): Intermediate: Gateway Routing** — Focuses on `GatewayClass`, `Gateway`, and `HTTPRoute` host/path matching.
19. **[ ] [`19`](examples/19/): Intermediate: TLS** — Terminates local HTTPS using a Kubernetes TLS Secret.
20. **[ ] [`20`](examples/20/): Intermediate: Service Calls** — Has one API call another through a ClusterIP Service and Kubernetes DNS.
21. **[ ] [`21`](examples/21/): Intermediate: Persistent Volume** — Writes data to a mounted volume and retains it after pod replacement.
22. **[ ] [`22`](examples/22/): Intermediate: StatefulSet** — Demonstrates stable pod identity, ordered deployment, and per-pod storage.
23. **[ ] [`23`](examples/23/): Intermediate: Metrics Server** — Installs local resource metrics and verifies them with `kubectl top`.
24. **[x] [`24`](examples/24/): Intermediate: HPA** — Scales an API between 2 and 10 replicas based on average CPU utilization.
25. **[x] [`25`](examples/25/): Intermediate: Helm** — Packages an API Deployment, Service, and optional HPA as a configurable Helm release.
26. **[ ] [`26`](examples/26/): Advanced: RBAC** — Gives a ServiceAccount the minimum permissions needed to read selected resources.
27. **[ ] [`27`](examples/27/): Advanced: Network Policy** — Restricts which pods may communicate with an internal service.
28. **[ ] [`28`](examples/28/): Advanced: Pod Disruption Budget** — Protects minimum availability during voluntary disruptions.
29. **[ ] [`29`](examples/29/): Advanced: KEDA Worker** — Scales a worker from queue depth instead of CPU utilization.
30. **[ ] [`30`](examples/30/): Advanced: OpenTelemetry** — Exports application traces and metrics to local observability tooling.
31. **[ ] [`31`](examples/31/): Advanced: Istio** — Demonstrates service-mesh routing and telemetry with Istio.
32. **[ ] [`32`](examples/32/): Advanced: Linkerd** — Demonstrates lightweight service-mesh traffic and telemetry with Linkerd.

Ingress controllers are intentionally separate: NGINX, Traefik, HAProxy, Kong, and Envoy use different controllers, annotations or APIs, and operational models.
