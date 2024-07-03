FROM debian:11

WORKDIR .

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN	chmod +x /usr/local/bin/docker-entrypoint.sh

COPY    ./conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]