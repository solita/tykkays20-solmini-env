yum update
curl -sSL https://get.docker.com/ | sh
service docker start
docker run -d -p 80:80 \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  jwilder/nginx-proxy
mkdir -p /tykkays20/html && \
  echo '<html><body>Hello, world!</body></html>' >/tykkays20/html/index.html
docker run --name tykkays20-nginx \
  -e VIRTUAL_HOST=tmp2-tykkays20 \
  -v /tykkays20/html:/usr/share/nginx/html:ro -d nginx
