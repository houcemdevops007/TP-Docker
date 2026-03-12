#!/bin/bash
# CHEAT SHEET: Advanced Docker Basics (Enrichment)

echo "=== Docker Inspect: Getting the container IP ==="
# Instead of searching manually, we can format the output of inspect!
# Example usage (uncomment once a container is running):
# docker run -d --name test-nginx nginx:alpine
# docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' test-nginx

echo "=== Docker Stats: Real-time monitoring ==="
# To monitor CPU, MEMORY, and Network IO:
# docker stats
# (Press Ctrl+C to exit)

echo "=== Docker System: Cleaning up everything safely ==="
# To remove all unused containers, networks, images (both dangling and unreferenced):
# docker system prune -a --volumes -f
