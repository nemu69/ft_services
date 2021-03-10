FROM alpine:3.12.3

RUN apk update
RUN apk add \
        mariadb \
        mariadb-client  \
        openrc \
        bash \
RUN rc-status
RUN touch /run/openrc/softlevel

ADD srcs/startup.sh .
RUN chmod 777 startup.sh
#RUN mkdir /run/mysqld
#COPY srcs/my.cnf /etc/my.cnf.d/my.cnf

EXPOSE 3306
CMD ./startup.sh
