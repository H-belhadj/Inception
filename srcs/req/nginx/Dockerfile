FROM debian:bullseye

#container will listen to this port at runtime. Its mapped to the hosts 443 (docker compose)
EXPOSE 443

#update and upgrade all packages in the container
RUN apt update -y && apt upgrade -y

#install the nginx and openssl
RUN apt install nginx -y && apt install openssl -y

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -newkey rsa:4096 -days 365\
		-out /etc/nginx/server.crt -keyout /etc/nginx/server.key \
		-subj "/CN=hbelhadj.42.fr/UID=hbelhadj"

#create a new directory in the container
RUN mkdir -p /run/nginx

#copy the server config from the host machine repo to the container
COPY conf/default /etc/nginx/sites-available/default

#run the service in the foreground
CMD [ "nginx", "-g", "daemon off;" ]
