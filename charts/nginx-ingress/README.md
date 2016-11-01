# Nginx-Ingress Controller

An Ingress Controller is a daemon, deployed as a Kubernetes Pod, that watches the ApiServer's /ingresses endpoint for updates to the Ingress resource. Its job is to satisfy requests for ingress.

This is a helm-chart for the "official" Kubernetes [Nginx-Ingress](https://github.com/kubernetes/contrib/tree/master/ingress/controllers/nginx) Controller. This chart includes the default-http-backend, which is used and configured in the Nginx-Ingress ConfigMap.

This chart is part of the DevOpsKube package.

Right now we do use version 0.8.3.

## Chart Details

This chart uses the configration from the [Nginx-Ingress Examples](https://github.com/kubernetes/contrib/tree/master/ingress/controllers/nginx/examples).

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

Installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the SonarQuebe chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`defaultBackend.containerPort`|Port of the Default-Backend Container|`8081`|
|`defaultBackendName`|The name of the default-Backend|`default-http-backend`|

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-nginx-ingress -f values.private.yaml nginx-ingress-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Check nginx

``
curl <IP>/healthz
curl <IP>:18080/nginx_status
``

# Todo

* the naming of the default-backend should be adopted, since right now the name is default backend without any release-name
* There is a dependency on the config-map of gogs (ssh), this should get adopted as well (to fix this right now, you do need to install gogs before installing nginx-ingress)
* because of https://github.com/kubernetes/kubernetes/issues/23920 we need to use hostNetwork: true in the ingress-controller, against all examples (thanks to [bacongobbler](http://blog.bacongobbler.com/)) for pointing this out to me
