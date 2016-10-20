# Keycloak Helm Chart

[Keycloak](http://www.keycloak.org/) is an Open Source Identity and Access Management.

This chart is partially based on the chart found at the [Fabric8 Charts](http://fabric8.io/helm/).

## Chart Details

Right now, we are using the docker Image from [jboss](https://hub.docker.com/r/jboss/keycloak/) in the version 2.2.1.

## Get this chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the Chart

The installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following table lists the configurable parameters of the Keycloak chart and their default values.

|       Parameter       |           Description            |                         Default                          |
|-----------------------|----------------------------------|----------------------------------------------------------|
|`hostName`|Hostname where this Instance can be reached| `key.example.com` |
|`keycloakUser`|Initial admin user| `admin` |
|`keycloakPass`|Initial password of the admin user| `admin123` |
|`containerPort`| Listening port of the container | `8080` |
|`logLevel`|LogLevel of the keycloak server|`INFO`|
|`mysql.databasePort`|The port of the database|`3306`|
|`mysql.databaseName`|The name of the database|`keycloak`|
|`mysql.databaseUser`|The database user|`keycloak`|
|`mysql.databasePassword`|The password of the database|`keycloak`|
|`mysql.persistence.path`|the path where the mysql stores the data on the  node|`/data/keycloak/mysql`|

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-keycloak -f values.yaml keycloak-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](https://github.com/devopskube/devopskube/blob/master/charts/keycloak/values.yaml)

## Persistence

This chart does not store any data on any volume.

# Todo

* Remove mysql dependency chart
* Add required.txt for the dependency
* Add LDAP
