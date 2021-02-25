FROM alpine:3.12.3

WORKDIR /app

RUN apk update
RUN apk add \
        mysql \
        mysql-client \
        openrc \
        bash

ADD startup.sh .
RUN chmod 0755 startup.sh
RUN mkdir /run/mysqld
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
ENTRYPOINT ["sh", "startup.sh"]
