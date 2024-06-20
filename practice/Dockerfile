FROM debian:11.0

RUN apt-get update && apt-get upgrade -y
COPY run.sh /run.sh

ENTRYPOINT [ "/bin/bash", "./tools/docker-entrypoint.sh" ]
