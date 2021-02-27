# Install MariaDB database(mariadb-install-db is a symlink to mysql_install_db).
mariadb-install-db -u root

# Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server.
mysqld -u root & sleep 5

#--- CONFIG MYSQL (BDD) ---#
#            WP            #
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "CREATE USER 'utilisateur'@'%' IDENTIFIED BY 'mot de passe';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'utilisateur'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
#---					---#

#           USER           #
mysql -u root -e "CREATE USER '$USER_WORDPRESS'@'localhost' identified by '$PASSWORD';" 
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$USER_WORDPRESS'@'localhost';" 
mysql -u root -e "FLUSH PRIVILEGES;"
#---					---#
#--------------------------#

# Start Telegraf and sleep infinity for avoid container to stop.
(telegraf conf &) & sleep infinite