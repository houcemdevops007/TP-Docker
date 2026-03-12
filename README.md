# Docker & Docker Compose Training Lab

Welcome to the **Docker & Docker Compose** practical training track! This comprehensive repository contains a series of hands-on labs (TPs) designed to take you from an absolute beginner to an expert in containerization.

## Course Structure

This training is divided into progressive labs. Each lab focuses on specific concepts, building upon the knowledge gained in the previous ones.

| Lab | Difficulty | Topic | Description |
|---|---|---|---|
| [**TP-01**](./tp-01-docker-basics/) | Beginner | *Docker Basics* | Introduction to Docker CLI, pulling images, and running containers. |
| [**TP-02**](./tp-02-docker-images/) | Beginner | *Building First Images* | Writing your first Dockerfile, building images, and running them. |
| [**TP-03**](./tp-03-volumes-networks/) | Beginner | *Volumes and Networks* | Understanding data persistence and container communication. |
| [**TP-04**](./tp-04-simple-webapp/) | Intermediate | *Simple Web App Stack* | Running multi-container applications (db + app) without Compose. |
| [**TP-05**](./tp-05-dockerfile-best-practices/) | Intermediate | *Dockerfile Best Practices* | Linting Dockerfiles with Hadolint and applying optimization patterns. |
| [**TP-06**](./tp-06-hadolint-integration/) | Intermediate | *Integrating Hadolint in CI* | Automating Dockerfile quality checks in Continuous Integration pipelines. |
| [**TP-07**](./tp-07-trivy-image-scan/) | Advanced | *Image Security Scan* | Using Trivy to find and fix vulnerabilities in Docker images. |
| [**TP-08**](./tp-08-docker-compose-beginner/) | Beginner | *Docker Compose Beginner* | Transitioning to Docker Compose to manage multi-container applications. |
| [**TP-09**](./tp-09-docker-compose-intermediate/) | Intermediate | *Docker Compose Intermediate* | Using networks, volumes, and reverse proxies in Compose. |
| [**TP-10**](./tp-10-docker-compose-advanced/) | Advanced | *Docker Compose Advanced* | Configuration management, resource limits, and healthchecks in Compose. |
| [**TP-11**](./tp-11-observability-logs-health/) | Advanced | *Observability: Logs, Health* | Centralizing container logs and designing robust health checks. |
| [**TP-12**](./tp-12-production-ready-stack/) | Expert | *Production-Ready Stack* | A complete lifecycle: best practices, CI/CD linting/scanning, and an optimized compose stack. |

## Prerequisites and Local Environment Setup

To follow these labs, ensure you have the following tools installed on your Linux (Ubuntu) or WSL2 environment:

1. **Docker Engine**: [Install Docker Engine](https://docs.docker.com/engine/install/)
2. **Docker Compose Plugin**: [Install Docker Compose](https://docs.docker.com/compose/install/linux/)
3. **Hadolint** (for TP-05+): [Install Hadolint](https://github.com/hadolint/hadolint#install)
4. **Trivy** (for TP-07+): [Install Trivy](https://aquasecurity.github.io/trivy/latest/getting-started/installation/)

## Recommended Order

We strongly advise you to follow the labs in numerical order (from TP-01 to TP-12), as complexity progressively increases.

## Cleaning Up Between Labs

To keep your environment clean and prevent port or name collisions, use the following commands after finishing a lab:

```bash
# Stop all running containers
docker stop $(docker ps -aq) 2>/dev/null || true

# Remove all stopped containers
docker rm $(docker ps -aq) 2>/dev/null || true

# Stop and remove resources created by a docker-compose.yml (Run in the TP folder)
docker compose down -v
```

Enjoy the training!
