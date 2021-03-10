service mariadb setup
service mariadb start

#--- CONFIG MYSQL (BDD) ---#

#        WP  + ADMIN       #
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress"
mysql -u root -e "CREATE USER 'utilisateur' IDENTIFIED BY 'password'"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'utilisateur'IDENTIFIED BY 'password'"
mysql -u root -e "FLUSH PRIVILEGES"
#---					---#

#           USER           #
mysql -u root -e "CREATE USER 'user1'@'localhost' identified by 'password';" 
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost';" 
mysql -u root -e "FLUSH PRIVILEGES;"
#---					---#

sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
service mariadb start
mysqld --user=root

#--------------------------#

# Start Telegraf and sleep infinity for avoid container to stop.
#(telegraf conf &) & 
sleep infinity