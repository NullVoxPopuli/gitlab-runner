apiVersion: v1
kind: ConfigMap
metadata:
  name: gitlab-runner
  namespace: gitlab-runner
data:
  entrypoint: |
    #!/bin/bash

    set -xe

    cp /scripts/config.toml /etc/gitlab-runner/

    # Register the runner
    /entrypoint register --non-interactive \
      --url $GITLAB_URL \
      --executor docker

    # Start the runner
    /entrypoint run --user=gitlab-runner \
      --working-directory=/home/gitlab-runner

  config.toml: |
    concurrent = 4

    [[runners]]
      name = "Kubernetes Runner"
      url = "https://gitlab.com/ci"
      token = "${GITLAB_CI_TOKEN}"
      executor = "docker"
      [runners.docker]
        privileged = true
        disable_cache = false
        volumes = ["/var/run/docker.sock:/var/run/docker.sock"]
        builds_dir = "/builds"
        cache_dir = "/cache"
