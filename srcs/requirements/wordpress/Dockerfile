FROM debian:11

RUN apt-get update -y && \
	apt-get upgrade -y

RUN	apt-get -y install \
	php-fpm \
	curl \
	php-mysql

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
