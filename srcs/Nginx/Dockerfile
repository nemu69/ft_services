FROM alpine:3.12.3

RUN apk update
RUN apk add bash
RUN apk add openrc
RUN apk add nginx
RUN apk add ufw

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl

# openssl and port
RUN apk add openssl
RUN apk add openssh
RUN adduser -D user
RUN echo "user:password"|chpasswd
RUN ssh-keygen -A
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY index.html /www/index.html
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=42, Inc./OU=IT/CN=ft_services"
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
ADD ./startup.sh .

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT ["sh", "startup.sh"]