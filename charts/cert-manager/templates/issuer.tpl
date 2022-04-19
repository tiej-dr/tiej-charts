---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: {{ .Values.issuer.name }}
spec:
  acme:
    {{- if or (eq .Values.tf.env "test")  (eq .Values.tf.env "test")  (eq .Values.tf.env "test") (eq .Values.tf.env "review") }}
    server: "https://acme-v02.api.letsencrypt.org/directory"
    {{- else }}
    server: "https://acme-staging-v02.api.letsencrypt.org/directory"
    {{- end }}
    email: {{ .Values.issuer.email }}

    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-{{ .Values.tf.project_id }}

    # ACME DNS-01 provider configurations
    solvers:
    # An empty 'selector' means that this solver matches all domains
    - selector: {}
      dns01:
        cloudDNS:
          # The ID of the GCP project
          project: {{ .Values.tf.project_id }}
          # This is the secret used to access the service account
          serviceAccountSecretRef:
            name: {{ .Values.tf.svc_secret_name }}
            key: letsencrypt-{{ .Values.tf.project_id }}