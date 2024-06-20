FROM debian:11

WORKDIR .

RUN apt-get update -y && \
	apt-get upgrade -y \
	&& apt-get install -y nginx openssl

COPY conf/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon"]

EXPOSE 443:443