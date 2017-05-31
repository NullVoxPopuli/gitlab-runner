#!/bin/bash
gitlab-runner register \
  --url $CI_SERVER_URL \
  --description "Dockerized Shell Runner" \
  --registration-token $REGISTRATION_TOKEN \
  --executor shell \
  --builds-dir /home/gitlab-runner/build \
  --cache-dir /home/gitlab-runner/cache

gitlab-runner run --working-directory /home/gitlab-runner
