# DotNet Core Jenkins Build Server #

# TL;DR
* Objective was to setup a [CD](https://en.wikipedia.org/wiki/Continuous_delivery) and then [CI](https://en.wikipedia.org/wiki/Continuous_integration) for dotnet core web api running in docker images on [Aws Ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
* Proof-of-concept project [dotnet core web api in a docker container](https://bitbucket.org/vk-smith/dotnetcore-api/src/master/README.md)
* This repo focuses on Jenkins Build Server setup
* Two options tested and documented [build on the host](./jenkins-build.md) and [build inside a container](./docker-build.md)
