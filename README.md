# DotNet Core Jenkins Build Server #

# TL;DR
* Objective was to setup a [CD](https://en.wikipedia.org/wiki/Continuous_delivery) and then [CI](https://en.wikipedia.org/wiki/Continuous_integration) for dotnet core web api running in docker images on [Aws Ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
* Proof-of-concept project [dotnet core web api in a docker container](https://bitbucket.org/vk-smith/dotnetapi/src/master/README.md)
* This repo focuses on Jenkins Build Server setup

# Setup on Ubuntu 16.06
* Login into vanilla instance of Ubuntu 16.06
* Clone repo:
```
git clone https://github.com/vkhazin/dotnetcore-build-jenkins.git
```
* Run commands:
```
chmod +x ./dotnetcore-build-jenkins/*.sh
./dotnetcore-build-jenkins/nginx.sh
./dotnetcore-build-jenkins/docker.sh
./dotnetcore-build-jenkins/aws-cli.sh
./dotnetcore-build-jenkins/dotnetcore.sh
./dotnetcore-build-jenkins/jenkins.sh
```
* After installation login using https://public-ip-address with password listed at the end of setup script
* Psss! Skip the start-up window - you have the required plug-ins installed already!

## Why NginX?
* Jenkins is not as easy to configure to use https: https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins that's why nginx was used to encrypt access
* NginX reverse proxy is somewhat easier to setup than to configure ssl on jenkins
* See [nginx.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/nginx.sh) for details

# Dynamic Dns (optional)
* Should you be interested in EC2 Dynamic Dns integration please see: http://vkhazin.postach.io/post/ddclient-namecheap-com-on-ubuntu-16-06