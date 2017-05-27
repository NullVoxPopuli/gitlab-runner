apiVersion: v1
kind: Secret
metadata:
  name: gitlab-runner
  labels:
    app: gitlab-runner
type: Opaque
data:
  runner-registration-token: "${GITLAB_CI_TOKEN}"
