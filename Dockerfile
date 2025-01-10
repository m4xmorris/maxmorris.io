FROM docker.io/library/nginx:alpine
COPY hugo/public/ /usr/share/nginx/html