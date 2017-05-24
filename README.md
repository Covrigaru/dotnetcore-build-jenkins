# DotNet Core Jenkins Build Server #

# TL;DR
* Objective was to setup a [CD](https://en.wikipedia.org/wiki/Continuous_delivery) and then [CI](https://en.wikipedia.org/wiki/Continuous_integration) for dotnet core web api running in docker images on [Aws Ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
* This repo focuses on Jenkins Build Server setup

# Setup on Ubuntu 16.06

## Dynamic Dns (optional)
http://vkhazin.postach.io/post/ddclient-namecheap-com-on-ubuntu-16-06

## Jenkins
* See [jenkins.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/jenkins.sh)
* Jenkins is not as easy to configure to use https: https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins

## NginX
* * NginX reverse proxy is somewhat easier to setup
* See [nginz.sh](https://github.com/vkhazin/dotnetcore-build-jenkins/blob/master/nginz.sh) for details

## Docker Support


## Aws Cli
