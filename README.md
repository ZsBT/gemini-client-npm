# Gemini Client CLI

This repository contains the Dockerfile and CI/CD workflows for the Gemini CLI client.

## Building and Running Locally

To build the image:
```bash
docker build -t gemini .
```

To run the container:
```bash
docker run -it -v $PWD/workspace:/workspace -v $PWD/settings:/home/ubuntu/.gemini gemini
```

## Healthcheck

The Docker container includes a built-in healthcheck:
```bash
docker inspect --format='{{json .State.Health}}' <container_id>
```

## CI/CD

GitHub Actions are configured to build and push images to the GitLab container registry. Ensure the following secrets are configured in the repository:
- `CI_REGISTRY`
- `CI_REGISTRY_USER`
- `CI_REGISTRY_PASSWORD`
- `CI_REGISTRY_IMAGE`
