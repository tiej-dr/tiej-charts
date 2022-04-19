{{- range .Values.certificates }}
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ .type }}-certificate-project-domain
spec:
  secretName: {{ .type }}-{{ .secretname }}
  issuerRef:
    name: letsencrypt-clouddns
    kind: ClusterIssuer
  dnsNames:
  - '*.{{ .dns }}'
  - {{ .dns }}

{{- end }}