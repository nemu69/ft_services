
chmod -R 755 /var/www/*

mkdir -p /var/www/html
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php


mkdir -p /etc/nginx/sites-available/
mkdir -p /etc/nginx/sites-enabled/


mysql -hmysql -Dwordpress -uuser -ppass < /run/nginx/wordpress.sql