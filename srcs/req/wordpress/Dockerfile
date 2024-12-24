FROM debian:bullseye

RUN apt update -y && \
    apt install -y php php-fpm php-mysql curl && \
    apt upgrade -y

COPY ./tools/script.sh /usr/local/bin

WORKDIR /usr/local/bin/

RUN chmod +x ./script.sh

EXPOSE 9000

CMD ["./script.sh"]
