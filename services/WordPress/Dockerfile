FROM alpine:3.12.3

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


RUN mkdir /run/nginx /www/ && chown -R nginx:nginx /www
RUN wget -q https://wordpress.org/latest.tar.gz
RUN	tar xzf latest.tar.gz -C /www/

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/nginx.conf /etc/nginx/conf.d/nginx.conf

ADD ./srcs/startup.sh .
RUN	chmod 777 startup.sh
ADD	srcs/wp-config.php /app/wordpress/.

EXPOSE 5050

CMD ./startup.sh