# DotNet Core Jenkins Build Server #

# TL;DR
* Objective was to setup a [CD](https://en.wikipedia.org/wiki/Continuous_delivery) and then [CI](https://en.wikipedia.org/wiki/Continuous_integration) for dotnet core web api running in docker images on [Aws Ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
* This repo focuses on Jenkins Build Server setup

# Setup on Ubuntu 16.06

## Dynamic Dns (optional)
http://vkhazin.postach.io/post/ddclient-namecheap-com-on-ubuntu-16-06

## Jenkins
See jenkins.sh

## NginX
* Jenkins is not as easy to configure to use https: https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins*
* NginX reverse proxy is somewhat easier to setup:
```
sudo apt install nginx -y
sudo mkdir /etc/nginx/certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/key.key -out /etc/nginx/certs/cert.crt -subj "/C=CA/ST=Ontario/L=Concord/O=end-points.io/OU=DevOps/CN=jenkins.end-points.io"
#sudo openssl dhparam -out /etc/nginx/certs/dhparam.pem 2048

sudo rm /etc/nginx/sites-available/default
echo "
upstream jenkins {
  server 127.0.0.1:8080 fail_timeout=0;
}

server {
  listen 80 default;
  server_name 127.0.0.1 *.mydomain.com;
  rewrite ^ https://$server_name$request_uri? permanent;
}

server {
  listen 443 default ssl;
  server_name 127.0.0.1 *.mydomain.com;

  ssl_certificate           /etc/nginx/certs/cert.crt;
  ssl_certificate_key       /etc/nginx/private/key.key;

  ssl_session_timeout  5m;
  ssl_protocols  SSLv3 TLSv1;
  ssl_ciphers HIGH:!ADH:!MD5;
  ssl_prefer_server_ciphers on;

  # auth_basic            "Restricted";
  # auth_basic_user_file  /home/jenkins/htpasswd;

  location / {
    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto https;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_redirect http:// https://;

    add_header Pragma "no-cache";

    proxy_pass http://jenkins;
  }
}" | sudo tee /etc/nginx/sites-available/jenkins
```

## Docker Support


## Aws Cli
