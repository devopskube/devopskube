# DevOpsKube

A Kubernetes "cluster" with all things SDLC (Software Development Life Cycle)/DevOps related.

## Motivation

It was/is the dream of the team to be able to install such a stack easily on own Hardware and/or environment. Kubernetes seems like the natural choice for this.

Up until now there is no full DevOps Stack for vanilla Kubernetes. The following "solutions" can be found when googling:

* [fabric8](http://fabric8.io/) - highly based on RedHats [OpenShift](https://www.openshift.com/), probably the closest to our requirements
* [Harbur](https://github.com/harbur/docker-sdlc) - mainly focused on docker and has no real kubernetes support
* [Software Factory](http://softwarefactory-project.io/) - from RedHat as well, based on OpenStack
* [Marcel Birkner](https://blog.codecentric.de/en/2015/10/continuous-integration-platform-using-docker-container-jenkins-sonarqube-nexus-gitlab/) - a blog-post from codecentric (merely an blog-post with some docker containers)
* [GoPaddle](https://www.gopaddle.io/#/) - seems to be focused on a full CI Environment to install Container on Kubernetes and uses eg. Jenkins, but is commercial and has a different focus then the above mentioned ones

None of the above mentioned stacks do fulfill our needs, therefor we decided to put this stack together to allow you to install a full SDLC stack on your own Kubernetes cluster.

## Components

The following components are included in the current version:

* [Redmine](components/redmine) - Project Management/Issue Tracking
* [Jenkins](components/jenkins) - Automation Server for CI and CD stuff
* [TheNexus](components/nexus) - Central Repository for Maven/Gradle/...
* [SonarQube](components/sonarqube) - Platform to manage code quality
* [Gogs](components/gogs) - central Git Repository
* [Keycloak](components/keycloak) - central authentication server

To provide central data-storeage options we are using [MySql](components/mysql) for all components in need of a database.

## Helper

Since a vanilla Kubernetes Cluster does not provide any Edge-Loadbalancer or an SSO-Component, we are going to provide documentation on how to setup the whole cluster including an Edge-Loadbalancer and other useful tools (eg. SSO Components). An initial set of Helpers are:

* [Nginx Ingress](components/nginx-ingress) - Load-Balancing for Kubernetes PODs
* [Kube-Lego](components/kube-lego) - Kube-Lego automatically requests certificates for Kubernetes Ingress resources from Let's Encrypt

For the use of a configurable set of PODs, we are using [helm](https://github.com/kubernetes/helm) in its latest (not yet ready for production) incarnation (> 2.0.0-alpha5).

## Contributions

Contributions to this project are very welcome. Please do not hesitate to fork this project and provide pull-requests. We try to integrate those asap.

Documentation is always nice, so pull-requests not only for code is welcome as well.

Contributions could be in the area of new features and/or bugs as well, please open a GitHub-Issue for this.

## Documentation

This documentation is generated using [MkDocs](http://www.mkdocs.org/). If you are editing this documentation, please make sure, that the Documentation can be generated. Provide a Pull-Request, if all is fine. We are then updating the Documentation. For details on how to generate the documentation, see the `build-docs.sh` script.
