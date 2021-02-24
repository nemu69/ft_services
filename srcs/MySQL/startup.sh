# Install MariaDB database(mariadb-install-db is a symlink to mysql_install_db).
mariadb-install-db -u root

# Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server.
mysqld -u root & sleep 5

# Create Wordpress database.
mysql -u root --execute="CREATE DATABASE wordpress;"

# Create new user "user" with password "user" and give permissions for PhpMyAdmin.
mysql -u root --execute="CREATE USER 'user'@'%' IDENTIFIED BY 'user'; GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

# Create new user "name" with password "name" and give permissions for Wordpress.
mysql -u root --execute="CREATE USER 'name'@'%' IDENTIFIED BY 'name'; GRANT ALL PRIVILEGES ON *.* TO 'name'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

# Start Telegraf and sleep infinity for avoid container to stop.
(telegraf conf &) & sleep infinite