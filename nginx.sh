# NginX reverse proxy for jenkins: https://gist.github.com/rdegges/913102
FQDN="jenkins.end-points.io"

sudo apt install nginx -y
sudo mkdir /etc/nginx/certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/key.key -out /etc/nginx/certs/cert.crt -subj "/C=CA/ST=Ontario/L=Concord/O=end-points.io/OU=DevOps/CN=$FQDN"
sudo rm /etc/nginx/sites-enabled/default

CONFIG="upstream jenkins {
  server 127.0.0.1:8080 fail_timeout=0;
}

server {
  listen 80 default;
  server_name 127.0.0.1 $FQDN;
  rewrite ^ https://\$server_name\$request_uri? permanent;
}

server {
  listen 443 default ssl;
  server_name 127.0.0.1 $FQDN;

  ssl_certificate           /etc/nginx/certs/cert.crt;
  ssl_certificate_key       /etc/nginx/certs/key.key;

  ssl_session_timeout  5m;
  ssl_protocols  SSLv3 TLSv1;
  ssl_ciphers HIGH:!ADH:!MD5;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_set_header Host \$http_host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto https;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_redirect http:// https://;

    add_header Pragma \"no-cache\";

    proxy_pass http://jenkins;
  }
}
" 
echo "$CONFIG" | sudo tee /etc/nginx/sites-available/jenkins

sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart
