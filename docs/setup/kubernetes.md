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
