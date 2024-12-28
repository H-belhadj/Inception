# Get base image from Docker Hub
FROM debian:bullseye

# Listen to port 3306 at runtime. Port 3306 is the default port for MariaDB
EXPOSE 3306

# Update, upgrade, and install MariaDB
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server

# Copy config file for MariaDB from the host to the container
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

# Copy setup script from the host machine to the container
COPY ./tools/script.sh /usr/local/bin

WORKDIR /usr/local/bin/

# Make the script executable
RUN chmod +x ./script.sh

# Run the script when the container starts
CMD ["./script.sh"]
