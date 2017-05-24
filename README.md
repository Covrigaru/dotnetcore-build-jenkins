# DotNet Core Jenkins Build Server #

# TL;DR
* Objective was to setup a [CD](https://en.wikipedia.org/wiki/Continuous_delivery) and then [CI](https://en.wikipedia.org/wiki/Continuous_integration) for dotnet core web api running in docker images on [Aws Ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
* Proof-of-concept project [dotnet core web api in a docker container]((https://bitbucket.org/vk-smith/dotnetapi/src/master/README.md)
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

## Dynamic Dns (optional)
http://vkhazin.postach.io/post/ddclient-namecheap-com-on-ubuntu-16-06

## NginX
* NginX reverse proxy is somewhat easier to setup than to configure ssl on jenkins
* See [nginx.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/nginx.sh) for details

## Docker Support
* See [docker.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/docker.sh) for details
* Jenkins user is added to docker group as part of the script to enable access to docker daemon

## Aws Cli
* See [aws-cli.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/aws-cli.sh) for details

## DotNet Core SDK
* See [dotnetcore.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/dotnetcore.sh) for details

## Jenkins
* See [jenkins.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/jenkins.sh)
* Jenkins is not as easy to configure to use https: https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins that's why nginx was used to encrypt access
* After installation login using https://public-ip-address with password listed at the end of setup script
* Skip the start-up window - you have all required plug-ins installed already!