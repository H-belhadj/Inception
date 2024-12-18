FROM debian::bullseye

EXPOSE 443

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y && apt install openssl -y

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -newkey rsa:4096 -days 365\
		-out /etc/nginx/server.crt -keyout /etc/nginx/server.key \
		-subj "/CN=hbelhadj.42.fr/UID=hbelhadj"

RUN mkdir -p /run/nginx

COPY /conf/default /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]