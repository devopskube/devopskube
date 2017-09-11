# Kube-Lego

[Kube-Lego](https://github.com/jetstack/kube-lego) automatically requests certificates for Kubernetes Ingress resources from Let's Encrypt.

## Chart Details

This chart is fully based on the [examples](https://github.com/jetstack/kube-lego/tree/master/examples/nginx) found on their github pages.

It uses version 0.1.5 of the corresponding docker image.

This chart needs a Nodeport, so that the letsencrypt server can contact us. This is configured via the properties .Values.extNodePort as well as .Values.legoKubeApiUrl.

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

The installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the SonarQuebe chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`email`|The email with which the certs are generated at LetsEncrypt|`cert@example.com`|
|`lego_url`|The Url with which the certificates are created, staging by default|`https://acme-staging.api.letsencrypt.org/directory`|
|`containerPort`|Port of the container|`8080`|
|`legoKubeApiUrl`|Url where the letsencrypt server contacts us|`http://lego.example.com`|
|`extNodePort`|The external port, where letsencrypt server contacts us|`32767`|

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-kube-lego -f values.private.yaml kube-lego-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](https://github.com/devopskube/devopskube/blob/master/charts/kube-lego/values.yaml)

> **Tip**: To use this in a production environment (not recommended by now), you should set the lego_url property to the corresponding production url of letsencrypt (https://acme-v01.api.letsencrypt.org/directory).

## Persistence

This chart stores the configuration inside its own configmap, no further persistence-store is necessary.

## Check availability

To check the availabilty of the kube-lego key, you can check the following url:

```
curl http://<HOSTNAME>/.well-known/acme-challenge/_selftest
```

# Todo
