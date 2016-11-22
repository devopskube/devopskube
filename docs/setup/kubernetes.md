# Kubernetes (k8s)

Because we do have some specific necessities (eg. SSL on all Applications, and we do have only one host), we do need to implement some specific settings in the kubernetes install. These settings are documented in here.

## SSL-Port

Usually the Kubernetes API (kube-api) is accessed using SSL on port 443. Because we do have just one node, this will hinder SSL connections to other Containers (using [Kube-Lego](../commponentes/kube-lego). Therefor we do need to set another port in the file `/etc/kubernetes/manifests/kube-apiserver.yaml` in the section `ports`. In this section we do need to change the default https ports from 443 to another one (eg 444):

```
ports:
- containerPort: 444
  hostPort: 444
  name: https
```

## SSO using Keycloak

With the following configuration settings, it is possible to use our own Keycloak container to provide SSO-functionality for Kubernetes (using OpenID Connect).

Before the Kubernetes settings should be put into place, the Keycloak application has to be configured. This is done using the following files.

Based on: http://apigee.com/about/blog/engineering/kubernetes-authentication-enterprise (not necessarily helpful, but...)
https://key.phreevpn.net/auth/realms/kubernetes/.well-known/openid-configuration
