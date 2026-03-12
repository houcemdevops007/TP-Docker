FROM python:3.11-slim-bullseye

WORKDIR /app

# Install system dependencies for psycopg2 (Postgres driver)
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Install python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Remove compilation tools to shrink attack surface
RUN apt-get purge -y --auto-remove gcc

# Copy app code
COPY app.py .

# Non-root setup
RUN useradd -m -s /bin/bash apiuser
USER apiuser

EXPOSE 5000
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
