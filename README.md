### Installing on your Kubernetes Cluster

```
cd ./helm
export GITLAB_CI_TOKEN=f31QPRizyLSXj2AuH6oM
export GITLAB_CI_URL=https://gitlab.com/ci
./install-runner
```

## Locally hook in to your gitlab server

### Starting The Runner

```bash
./gitlab-runner up
```

### Shutting Down

```bash
./gitlab-runner down
```
