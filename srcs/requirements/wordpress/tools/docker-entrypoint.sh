#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/bin/wp

wp core download --allow-root

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root

wp core install --url=$URL  --title="WordPress Website Title" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root

wp user create seonggoc jmsmg1@me.com --role=author --user_pass=$USER_PASS --allow-root

/etc/init.d/php7.4-fpm start
/etc/init.d/php7.4-fpm stop

php-fpm7.4 -F