# Cert-Issuer for Cert-Manager

## Chart Details

This chart is fully based on the [Quick-Start](https://github.com/jetstack/cert-manager/blob/master/docs/tutorials/acme/quick-start/index.rst) 
found on the github pages of [Cert-Manager](https://github.com/jetstack/cert-manager).

## Configuration

The following tables lists the configurable parameters of the chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`issuer.secretref`|Name of the secret-certificate|`letsencrypt`|
|`issuer.email`|The email with which the certs are generated at LetsEncrypt|`cert@example.com`|
|`issuer.url`|The Url with which the certificates are created, staging by default|`https://acme-staging.api.letsencrypt.org/directory`|

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-kube-lego -f values.private.yaml kube-lego-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](https://github.com/devopskube/devopskube/blob/master/charts/kube-lego/values.yaml)

> **Tip**: To use this in a production environment (not recommended by now), you should set the lego_url property to the corresponding production url of letsencrypt (https://acme-v01.api.letsencrypt.org/directory).

## Check availability

To check the availabilty of the kube-lego key, you can check the following url:

```
curl http://<HOSTNAME>/.well-known/acme-challenge/_selftest
```
