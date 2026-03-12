# ==========================================
# STAGE 1: Build (Simulating Node/WebPack)
# ==========================================
FROM alpine:3.18 AS builder

WORKDIR /app
# We create a simple static artifact to simulate a compiled React/Vue app
RUN echo "<h1>Welcome to the Ultra Prod-Ready Frontend</h1><p>Built via Multi-Stage Dockerfile</p>" > index.html

# ==========================================
# STAGE 2: Production Serving (Minimal)
# ==========================================
FROM nginx:1.25-alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy ONLY the built artifacts from Stage 1
COPY --from=builder /app/index.html /usr/share/nginx/html/

# Secure NGINX: Drop root privileges for the master process in prod
# Provide nginx user with access
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Run as non-root
USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
