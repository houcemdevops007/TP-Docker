# ENRICHED: Using a specific minimal tag
FROM python:3.9-slim-bullseye

# ENRICHED: Adding metadata (Labels) to the image
LABEL maintainer="KHLIFI HOUCEM - DevSecOps"
LABEL version="1.0"
LABEL description="Enriched Python Flask API image"

# Set the working directory
WORKDIR /usr/src/app

# Cache optimization: Copy requirements first
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code (respects the .dockerignore file!)
COPY app/ ./

# ENRICHED: Add a healthcheck directly in the Dockerfile
# This tells Docker how to test if the container is still working
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

EXPOSE 5000

# ENRICHED: Explicit environment variable default
ENV ENV_NAME="Production"

CMD ["python", "app.py"]
