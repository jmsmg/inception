#!/bin/bash
# set -e

service mariadb start

mysql -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# tail -f /dev/null