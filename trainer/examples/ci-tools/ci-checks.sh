#!/bin/bash

echo "Running Hadolint on all Dockerfiles..."
docker run --rm -i hadolint/hadolint < Dockerfile
docker run --rm -i hadolint/hadolint < Dockerfile-python
docker run --rm -i hadolint/hadolint < Dockerfile-python-alpine

echo "Scanning images with Trivy..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v aquacache:/root/.cache aquasec/trivy image flask-app:ubuntu
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v aquacache:/root/.cache aquasec/trivy image flask-app:python3
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v aquacache:/root/.cache aquasec/trivy image flask-app:python3-alpine

# docker run --rm -v aquacache:/root/.cache aquasec/trivy image flaskapp:python3
# docker run --rm -v aquacache:/root/.cache aquasec/trivy image flaskapp:python3-alpine
