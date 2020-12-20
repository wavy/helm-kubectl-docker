# helm-kubectl-docker

Wavy Labs fork of https://github.com/lwolf/helm-kubectl-docker.

This is a script to build Docker images with kubectl and helm with the specified version.
The script builds for both amd64 and arm64. 

Example usage:

```
docker login
docker buildx create --use
./build.sh v1.15.5 v2.17.0
```
