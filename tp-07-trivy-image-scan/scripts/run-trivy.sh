#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./run-trivy.sh <image-name>"
  exit 1
fi

IMAGE_NAME=$1

echo "Scanning image $IMAGE_NAME for HIGH and CRITICAL vulnerabilities..."

# ENRICHED: Added `.trivyignore` support injected automatically via Volume mount in the scanner
if command -v trivy &> /dev/null; then
    trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$IMAGE_NAME"
else
    # Assuming .trivyignore is in the current directory
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
        -v $(pwd)/.trivyignore:/.trivyignore \
        aquasec/trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$IMAGE_NAME"
fi

if [ $? -eq 0 ]; then
    echo "✅ Image $IMAGE_NAME passed the security scan!"
else
    echo "❌ Image $IMAGE_NAME failed the security scan!"
    exit 1
fi
