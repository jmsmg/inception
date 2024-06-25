#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj "/DC=org/DC=OpenSSL/DC=users/UID=123456+CN=John Doe"

service nginx start
service nginx stop

nginx -g "daemon off;"