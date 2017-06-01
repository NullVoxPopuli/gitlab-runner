## Setup

```bash
./helm repo add gitlab https://charts.gitlab.io
./helm install --namespace gitlab-runner --name gitlab-runner -f ./values.yaml gitlab/gitlab-runner
./helm upgrade gitlab-runner --set gitlabUrl=https://gitlab.com/ci,runnerRegistrationToken=my-repo-token gitlab/gitlab-runner

```
