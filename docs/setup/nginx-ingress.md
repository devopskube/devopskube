# Nginx-Ingress

In previous versions, we have provided our own Helm chart of an nginx-ingress controller. 
Now the community provides an enhanced Nginx-Ingress for all environments, therefor we decided to 
just use this one.

For detailed informations, take a look on the [Nginx-Ingress Homepage](https://kubernetes.github.io/ingress-nginx/).

## Install on minikube

Details can be found [here](https://kubernetes.github.io/ingress-nginx/deploy/#minikube).

```
minikube addons enable ingress
```

We do need some further tcp-services, which are defined in the tcp-service configmap. To use these, the
following command should be run:

```
kubectl --namespace=kube-system replace -f gogs/templates/configmap-ssh.yaml
```

## Install on any other environment

For installation on other cloud and/or bare metal environments, please consult the documentation of the 
inginss-nginx. To be able to configure the above already mentioned ssh tcp-service, the above shown command 
should be used.

In the long run, we do need to configure an own helm values, to provide theses settings automatically.

