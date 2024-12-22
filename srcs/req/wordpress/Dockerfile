FROM debian:bullseye

RUN apt update

RUN apt install -y php php-fpm php-mysql curl

RUN apt upgrade -y

COPY ./tools/script.sh /usr/local/bin

WORKDIR /usr/local/bin/

RUN chmod +x ./script.sh

EXPOSE 9000

CMD ["./script.sh"]
