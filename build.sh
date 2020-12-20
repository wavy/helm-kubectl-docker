#!/bin/bash

K8S_VERSION=$1
HELM_VERSION=$2

set -euo pipefail

export DOCKER_REPO=wavyfm/helm-kubectl-docker
export RELEASE=${K8S_VERSION}-${HELM_VERSION}

# docker manifest inspect ${DOCKER_REPO}:${RELEASE} > /dev/null && echo "Version ${RELEASE} is already exists" && exit 0

# Build image
docker buildx build --platform linux/amd64,linux/arm64 \
    -t ${DOCKER_REPO}:${RELEASE} \
    --push \
    --build-arg K8S_VERSION=${K8S_VERSION} \
    --build-arg HELM_VERSION=${HELM_VERSION} .

