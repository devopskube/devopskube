# MySQL

[MySQL]https://www.mysql.com/) is the database used in all our charts as a data store right now.

## Chart Details

This chart is fully based on the [Kubernetes Chart](https://github.com/kubernetes/charts) found.

It uses version 0.0.5 of our own [docker image](https://github.com/devopskube/docker-mysql).

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
|`cpu`|The CPU resource limit|`200m`|
|`memory`|The RAM resource limit|`512Mi`|
|`databaseName`|The name of the database|`test`|
|`databaseUser`|The user of the database|`test`|
|`databasePassword`|The password of the database user|`test`|
|`databaseCharset`|The Charset used in the database|`utf8`|
|`databaseCollation`|The Collation used in the database|`utf8_unicode_ci`|
|`persistence.path`|The path where the data is stored|`/data/mysql`|

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-kube-lego -f values.private.yaml kube-lego-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](https://github.com/devopskube/devopskube/blob/master/charts/mysql/values.yaml)

## Persistence

To be able to keep stateful data in the mysql kubernetes container, the following path is used:

```
/data/mysql
```

> **Tip**: This path should be adopted for each database instance you set up (eg. for each application)

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

# Todo

* Right now SonarQube is using a MySQL version of 5.7 (this is a hardcoded requirement for MySQL), but for other Charts, we could use later versions (MariaDB)
* Use a HA/Cluster version of MariaDB/MySQL
