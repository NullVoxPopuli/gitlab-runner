apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: gitlab-runner
  namespace: gitlab-runner
  labels:
    name: gitlab-runner
spec:
  replicas: 1
  template:
    metadata:
      labels:
        name: gitlab-runner
    spec:
      containers:
      - name: gitlab-runner
        image: gitlab/gitlab-runner:alpine
        imagePullPolicy: Always
        command: ["/bin/bash", "/scripts/entrypoint"]
        env:
        - name: DOCKER_HOST
          value: /var/run/docker.sock
        - name: GITLAB_URL
          value: ${GITLAB_URL}

        livenessProbe:
          exec:
            command: ["/usr/bin/pgrep","gitlab-ci-multi"]
          initialDelaySeconds: 60
          timeoutSeconds: 1
          periodSeconds: 10
          successThreshold: 1
          failureThreshold: 3
        readinessProbe:
          exec:
            command: ["/usr/bin/pgrep","gitlab-ci-multi"]
          initialDelaySeconds: 10
          timeoutSeconds: 1
          periodSeconds: 10
          successThreshold: 1
          failureThreshold: 3

        volumeMounts:
        - name: docker-sock
          mountPath: /var/run/docker.sock
        - name: config
          mountPath: /etc/gitlab-runner
        - name: build-dir
          mountPath: /builds
        - name: cache-dir
          mountPath: /cache
        - name: scripts
          mountPath: /scripts

      volumes:
      - name: config
        configMap:
          name: gitlab-runner
      - name: build-dir
        hostPath:
          path: /builds
      - name: cache-dir
        hostPath:
          path: /cache
      - name: docker-sock
        hostPath:
          path: /var/run/docker.sock
      - name: scripts
        configMap:
          name: gitlab-runner
