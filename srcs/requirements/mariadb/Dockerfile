FROM debian:11

RUN apt-get update -y && \
	apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
	
COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]