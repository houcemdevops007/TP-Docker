FROM nginx:1.24.0-alpine

# Set non root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
