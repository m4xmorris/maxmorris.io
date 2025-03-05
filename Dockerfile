LABEL org.opencontainers.image.source=https://github.com/m4xmorris/maxmorris.io
LABEL org.opencontainers.image.description My personal linktree and CV site
FROM docker.io/library/nginx:alpine
COPY hugo/public/ /usr/share/nginx/html
