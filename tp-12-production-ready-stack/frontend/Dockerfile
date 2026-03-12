# Stage 1: Build (simulated for plain HTML for structural learning)
FROM alpine:3.18 as builder
WORKDIR /app
COPY index.html .

# Stage 2: Final Image
FROM nginx:1.25.3-alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
