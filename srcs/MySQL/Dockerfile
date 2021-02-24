FROM alpine:latest

WORKDIR /app

RUN apk update
RUN apk add mysql mysql-client

COPY startup.sh /startup.sh
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
