### Starting The Runner

```bash
./gitlab-runner daemon
./gitlab-runner register
```

### Shutting Down

```bash
./gitlab-runner down
```

### Running Locally

Copy `gitlab-runner`, `config.toml`, and `docker-compose.gitlab.yml` to your project's directory

```bash
./gitlab-runner go
```
