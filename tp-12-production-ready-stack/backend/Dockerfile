FROM python:3.10-alpine3.18

WORKDIR /usr/src/app

# Install dependencies needed for psycopg2 (Postgres driver)
RUN apk add --no-cache postgresql-libs && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
    apk add --no-cache curl

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    apk --purge del .build-deps

COPY app.py ./

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
