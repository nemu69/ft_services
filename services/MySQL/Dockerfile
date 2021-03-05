FROM alpine:3.12.3

WORKDIR /app

RUN apk update
RUN apk add \
        mysql \
        mysql-client \
        openrc \
        bash \
        -no-cache

ADD srcs/startup.sh .
RUN chmod 777 startup.sh
RUN mkdir /run/mysqld
COPY srcs/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ./startup.sh
