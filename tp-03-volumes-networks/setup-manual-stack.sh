#!/bin/bash
# ENRICHED: Script to demonstrate the tedious manual network orchestration

echo "1. Creating the bridge network..."
docker network create manuel-net || true

echo "2. Starting PostgreSQL with a named volume..."
docker volume create manuel-db-data
docker run -d --name my-postgres --network manuel-net \
    -e POSTGRES_PASSWORD=secret \
    -v manuel-db-data:/var/lib/postgresql/data \
    postgres:15-alpine

echo "3. Starting Adminer to connect to PostgreSQL..."
docker run -d --name my-adminer --network manuel-net \
    -p 8080:8080 adminer:latest

echo "Setup complete. Access adminer at localhost:8080."
echo "Notice how complex this is compared to Docker Compose!"
