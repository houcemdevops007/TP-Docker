#!/bin/bash

# Ensure an image name was passed as an argument
if [ -z "$1" ]; then
  echo "Usage: ./run-trivy.sh <image-name>"
  exit 1
fi

IMAGE_NAME=$1

echo "Scanning image $IMAGE_NAME for HIGH and CRITICAL vulnerabilities..."

# We set --exit-code to 1 so the CI fails if vulnerabilities are found
# We set --ignore-unfixed to ignore vulnerabilities that don't have a patch available yet
if command -v trivy &> /dev/null; then
    trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$IMAGE_NAME"
else
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
        aquasec/trivy image --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 "$IMAGE_NAME"
fi

if [ $? -eq 0 ]; then
    echo "✅ Image $IMAGE_NAME passed the security scan!"
else
    echo "❌ Image $IMAGE_NAME failed the security scan!"
    exit 1
fi
