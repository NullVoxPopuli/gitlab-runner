apiVersion: v1
kind: ConfigMap
metadata:
  name: gitlab-runner
  namespace: gitlab-runner
data:
  config.toml: |
    concurrent = 4

    [[runners]]
      name = "Kubernetes Runner"
      url = "https://gitlab.com/ci"
      token = "${GITLAB_CI_TOKEN}"
      executor = "kubernetes"
      [runners.kubernetes]
        namespace = "gitlab-runner"
        namespace_overwrite_allowed = "ci-.*"
        privileged = true
        poll_interval = 5
        poll_timeout = 3600
        [runners.kubernetes.node_selector]
          gitlab = "true"
