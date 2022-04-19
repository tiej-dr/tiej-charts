{{- range .Values.namespaces }}
---
apiVersion: v1
data:
  tls.crt: ""
  tls.key: ""
kind: Secret
metadata:
  annotations:
    kubed.appscode.com/sync: ""
  name: {{ . | quote }}
type: kubernetes.io/tls

{{- end }}