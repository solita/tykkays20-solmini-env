#!/bin/sh
sudo docker run -d -p 9000:9000 --name dockerui \
  -e VIRTUAL_HOST=dockerui.solmini.tykkays20.solita.fi \
  -e VIRTUAL_PORT=9000 --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui
