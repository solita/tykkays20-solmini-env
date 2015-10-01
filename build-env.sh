#!/bin/sh
yum update
curl -sSL https://get.docker.com/ | sh
service docker start

# Front reverse proxy with virtual host autoconfiguration
# *** Privileged docker container ***
docker run -d -p 80:80 \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  jwilder/nginx-proxy

# Generate html content for solmini demo
mkdir -p /tykkays20/html && \
  echo '<html><body>Hello, world!</body></html>' >/tykkays20/html/index.html

# Solmini demo "Hello, world!"
docker run --name solmini \
  -e VIRTUAL_HOST=solmini.tykkays20.solita.fi \
  -v /tykkays20/html:/usr/share/nginx/html:ro -d nginx

# Jenkins master
docker run -d --name jenkins-master \
  -e VIRTUAL_HOST=jenkins.tykkays20.solita.fi \
  -e VIRTUAL_PORT=8080 \
  -e "JAVA_OPTS=-Duser.timezone=EET -Dfile.encoding=UTF8" \
  -p 8080:8080 -p 50000:50000 \
  sirkkalap/jenkins-swarm-w-git-manual:latest
