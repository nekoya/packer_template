#
# nginx
#
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" > /etc/apt/sources.list.d/nginx.list
curl -L http://nginx.org/keys/nginx_signing.key | apt-key add -
apt-get update
apt-get install -y nginx

echo "ssl_certificate      /etc/ssl/certs/ssl-cert-snakeoil.pem;
ssl_certificate_key  /etc/ssl/private/ssl-cert-snakeoil.key;" > /etc/nginx/conf.d/ssl.conf
