# Use the Debian Bullseye base image
FROM debian:bullseye

# Container will listen on port 443 at runtime (mapped to host's 443 port in Docker Compose)
EXPOSE 443

# Update, upgrade packages, install nginx, openssl, and create directories for SSL and nginx
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -newkey rsa:4096 -days 365 \
        -out /etc/nginx/server.crt -keyout /etc/nginx/server.key \
        -subj "/CN=hbelhadj.42.fr/UID=hbelhadj" && \
    mkdir -p /run/nginx

# Copy the Nginx server configuration from the host to the container
COPY conf/default /etc/nginx/sites-available/default

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
