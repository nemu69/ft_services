FROM alpine:3.12.3

RUN apk update
RUN apk add nginx

RUN adduser -D -g 'Nginx www user' www
RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /www/index.html

# SSL

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# SSH

RUN apk add openrc --no-cache
RUN apk add openssh
RUN adduser -D user
RUN echo "user:password"|chpasswd
RUN ssh-keygen -A
COPY ./srcs/sshd_config /etc/ssh/

ADD ./srcs/startup.sh .
RUN	chmod 777 startup.sh

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ./startup.sh