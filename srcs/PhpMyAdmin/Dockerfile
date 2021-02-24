FROM alpine:latest

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf

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
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvfz phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin
VOLUME [ “/sys/fs/cgroup” ]
EXPOSE 5000

CMD nginx && php-fpm7 && tail -f /var/log/nginx/access.log