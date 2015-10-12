#!/bin/sh
# 1. Asenna docker
# ansible-playbook -i dev-inventory --ask-become-pass jenkins-slave.yml
# 2. Lisää Jenkinsiin käyttäjä jenkins/jenkins orjaa varten
# 3. Lataa ja suorita tämä skripti

JENKINS_MASTER_URL=${1:?Usage $0 <JENKINS_MASTER_URL>}

sudo docker run -i --rm \
  -e "JAVA_OPTS=-Dfile.encoding=UTF8" \
  sirkkalap/jenkins-swarm-slave-nlm:java8 \
  -master ${JENKINS_MASTER_URL} \
  -labels lein -labels node -labels firefox -labels maven -labels xvfb \
  -username jenkins -password jenkins \
  -executors 1
