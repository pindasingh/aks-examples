{{- define "basic-api.name" -}}
{{- printf "%s-basic-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "basic-api.labels" -}}
app.kubernetes.io/name: basic-api
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}
