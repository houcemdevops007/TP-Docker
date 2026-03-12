#!/bin/bash
set -e

echo "Running Hadolint on all Dockerfiles in the repository..."

# Find all Dockerfiles and lint them using the dockerized hadolint
find . -type f -name '*Dockerfile*' -print0 | while IFS= read -r -d '' file; do
    echo "Linting $file..."
    
    if command -v hadolint &> /dev/null; then
        hadolint "$file" || exit 1
    else
        # Fallback to Docker image if local binary is not found
        docker run --rm -i hadolint/hadolint < "$file" || exit 1
    fi
done

echo "✅ All Dockerfiles passed linting!"
