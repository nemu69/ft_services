FROM alpine:3.12.3

WORKDIR /app

RUN apk update
RUN apk add \
        nginx \
        openrc \
        bash \
        php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-session \
        php7-soap \
        php7-xml \
        php7-zip \
		php7-mysqli


RUN mkdir /run/nginx
RUN wget -q https://wordpress.org/latest.tar.gz &&\
	tar xvf latest.tar.gz
# RUN rm latest.tar.gz

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
ADD ./startup.sh .

EXPOSE 5050
# CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
ENTRYPOINT ["sh", "startup.sh"]