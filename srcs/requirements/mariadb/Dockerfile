FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server mariadb-client

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
	
COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
