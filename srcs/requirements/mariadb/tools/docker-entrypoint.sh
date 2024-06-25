#!/bin/bash

service mariadb start
echo "hihi"

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

# chmod +x /usr/sbin/mariadbd 
# chmod -R 777 /var/lib/mysql
# rm -f /var/lib/mysql/aria_log_control*

/usr/sbin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --skip-log-error --pid-file=/run/mysqld/mysqld.pid --socket=/run/mysqld/mysqld.sock --bind-address=0.0.0.0

# tail -f

# TODO
# 연결 되는지 쏴봐야함