#!/bin/bash
set -e

echo "Running Hadolint on all Dockerfiles in the repository..."

find . -type f -name '*Dockerfile*' -print0 | while IFS= read -r -d '' file; do
    echo "Linting $file..."
    
    if command -v hadolint &> /dev/null; then
        hadolint "$file" || exit 1
    else
        docker run --rm -i hadolint/hadolint < "$file" || exit 1
    fi
done

echo "✅ All Dockerfiles passed linting!"

# ENRICHED: Also check docker-compose syntaxes if valid
echo "Checking docker-compose validity..."
find . -type f -name 'docker-compose*.yml' -print0 | while IFS= read -r -d '' comp; do
    echo "Validating $comp..."
    docker compose -f "$comp" config -q || exit 1
done

echo "✅ CI Pipeline Check Complete!"
