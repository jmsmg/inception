#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/bin/wp

wp core download --allow-root

wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root

wp core install --url=seonggoc.42.fr  --title="WordPress Website Title" --admin_user=gon --admin_password=123123 --admin_email="seonggoc@student.42seoul.kr" --allow-root

wp user create seonggoc jmsmg1@me.com --role=author --user_pass=123123 --allow-root

/etc/init.d/php7.4-fpm start
/etc/init.d/php7.4-fpm stop

php-fpm7.4 -F