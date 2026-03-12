#!/bin/bash
set -e

echo "🚀 Starting CI Pipeline..."

# 1. Linting
echo "🔍 Step 1: Linting Dockerfiles with Hadolint..."
for df in frontend/Dockerfile backend/Dockerfile; do
    echo "Linting $df..."
    # Using Dockerized hadolint
    docker run --rm -i hadolint/hadolint < "$df" || exit 1
done

# 2. Building
echo "🔨 Step 2: Building Images..."
docker build -t prod-frontend:latest ./frontend
docker build -t prod-backend:latest ./backend

# 3. Security Scanning
echo "🛡️ Step 3: Security Scan with Trivy..."
for img in prod-frontend:latest prod-backend:latest; do
    echo "Scanning $img..."
    if command -v trivy &> /dev/null; then
        trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$img" || exit 1
    else
        docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$img" || exit 1
    fi
done

echo "✅ CI Pipeline completed successfully. Ready for deployment!"
