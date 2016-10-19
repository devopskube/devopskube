# Nexus

This is a helm-chart for [nexxus]

This chart is part of the DevOpsKube package.

It is right now fully based on the [bitnami](https://github.com/bitnami/charts/tree/master/redmine) redmine chart.

## TODO

this url is password protected, therefor this can not get called without username password

livenessProbe:
  httpGet:
    path: /service/metrics/ping
    port: http
  initialDelaySeconds: 120
  timeoutSeconds: 5
readinessProbe:
  httpGet:
    path: /service/metrics/ping
    port: http
  initialDelaySeconds: 5
  timeoutSeconds: 1


## Dependencies

This chart uses the following sub-dependencies:

mariadb

## Variables

To be able to use this package, the following variables should be set.

see values.yaml


## Roadmap

provide git as a scm system, does not seem to work right now.


# Redmine

[Nexus](http://www.sonatype.org/nexus/) is the world's only repository manager with FREE support for popular formats..

Right now we do use version 3.0.2.

## Chart Details

This chart uses the docker image from [sonatype](https://github.com/sonatype/docker-nexus3).

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

Other installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the Nexus chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`hostName`|Host Name of this Instance|`nexus.example.com`|
|`containerPort`|Port of the container|`8081`|
|`maxMem`|Resource limit memory (-Xmx)|`1200M`|
|`minMem`|Minimum Memory (-Xms)|`1200M`|
|`javaOpts`|Additional options for the JVM|''|
|`persistence.path`|Path where all data on the host is stored|`/data/nexus`|

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-nexus -f values.private.yaml nexus-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

The initial Username/Pasword combination for the first login is: `admin/admin123`.

## Persistence

To be able to keep stateful data in the nexus kubernetes container, the following path is used:

```
/data/nexus
```

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

# Todo

* Provide more initial configurations (smtp-settings, ldap-settings, ...)
* use LDAP and SSO
