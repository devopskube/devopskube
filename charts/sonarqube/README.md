# SonarQube

[SonarQube](http://www.sonarqube.org/) is an open platform to manage code quality.

Right now we do use version 6.1.

## Chart Details

This chart uses the docker image from [sonarqube](https://github.com/SonarSource/docker-sonarqube). Furthermore it has a requirement on our Mysql-Chart to provide a datastore.

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

If you have cloned this repository, you do need to update the requirements of this chart beforehand via `helm dependencies update` in the chart-folder.

Other installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the SonarQuebe chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`hostName`|Host Name of this Instance|`sonar.example.com`|
|`containerPort`|Port of the container|`9000`|
|`persistence.dataPath`|Path were the data of SonarQube is stored|`/data/sonarqube/data`|
|`persistence.extensionsPath`|Path were extenstions to SonarQube are stored|`/data/sonarqube/extensions`|
|`mysql.databasePort`|The port of the database|`3306`|
|`mysql.databaseName`|The name of the database|`sonar`|
|`mysql.databaseUser`|The database user|`sonar`|
|`mysql.databasePassword`|The password of the database|`sonar`|
|`mysql.persistence.path`|the path where the mysql stores the data on the  node|`/data/sonarqube/mysql`|

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-sonar -f values.private.yaml sonarqube-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

The initial Username/Pasword combination for the first login is: `admin/admin`.

## Persistence

To be able to keep stateful data in the redmine kubernetes container, the following path is used:

```
/data/sonarqube/data
```

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

# Todo

* Adopt persistence to be able to run this in the cloud as well as on single node "clusters"
* Update to a later version of MariaDb
* Use LDAP and SSO
