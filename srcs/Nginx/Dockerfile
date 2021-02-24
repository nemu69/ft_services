FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add nginx

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
ADD ./startup.sh .

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT ["sh", "startup.sh"]