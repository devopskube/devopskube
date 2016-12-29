# Redmine

[Redmine](http://www.redmine.org) is a flexible project management and issue tracking web application.

This chart was based on the [bitnami](https://github.com/bitnami/charts/tree/master/redmine) redmine chart, but adopted to our needs.

Right now we do use version 3.3.1.

## Chart Details

This chart uses the docker image from [sameersbn](https://github.com/sameersbn/docker-redmine). Furthermore it has a requirement on our Mysql-Chart to provide a datastore.

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

If you have cloned this repository, you do need to update the requirements of this chart beforehand via `helm dependencies update` in the chart-folder.

Other installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the Redmine chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
|`hostName`|Host Name of this Instance|`redmine.example.com`|
|`redminePort`|Port of the container|`80`|
|`redmineHttps`|Should https be enabled|`false`|
|`nginx.enabled`|Should the Nginx-Server be startet|`true`|
|`nginx.workers`|The number of nginx workers to start.|`1`|
|`nginx.maxUploadSize`|Maximum acceptable upload size|`20m`|
|`unicorn.workers`|The number of unicorn workers to start|`2`|
|`unicorn.timeout`|Sets the timeout of unicorn worker processes|`60`|
|`smtp.enabled`|Enable mail delivery via SMTP|`false`|
|`smtp.domain`|SMTP domain|`example.com`|
|`smtp.host`|SMTP server host|`smtp.google.com`|
|`smtp.port`|SMTP server port|`587`|
|`smtp.user`|SMTP username|`username`|
|`smtp.pass`|SMTP password|`password`|
|`smtp.method`|SMTP delivery method. Possible values: `smtp`, `async_smtp`|`smtp`|
|`smtp.opensslVerifyMode`|SMTP openssl verification mode. Accepted values are `none`, `peer`, `client_once` and `fail_if_no_peer_cert`|`none`|
|`smtp.startTLS`|Enable STARTTLS|`true`|
|`smtp.TLS`|Enable SSL/TLS|`false`|
|`smtp.authentication`|Specify the SMTP authentication method|`:login`|
|`persistence.enabled`|Enable persistence|`true`|
|`persistence.storageClass`|storageClass|`generic`|
|`persistence.accessMode`|Access Mode of the persistence volume|`ReadWriteOnce`|
|`persistence.size`|Size of the volume|`8Gi`|
|`persistence.path`|Path where all data on the host is stored|`/data/redmine/files`|
|`persistence.log.path`|Path where all logs on the host are stored|`/data/redmine/logs`|
|`databaseAdapter`|The databaseAdapter to use `mysql`. `mysql2` or `postgresql`|`mysql`|
|`mysql.databasePort`|The port of the database|`3306`|
|`mysql.databaseName`|The name of the database|`redmine`|
|`mysql.databaseUser`|The database user|`redmine`|
|`mysql.databasePassword`|The password of the database|`redmine`|
|`mysql.persistence.path`|the path where the mysql stores the data on the  node|`/data/redmine/mysql`|
|`scm.autoCreate`|Are repos created automatically during project creation?|`force`|
|`scm.forceRepo`|Is Repo Module enabled on project creation?|`true`|
|`scm.denyDelete`|Deletion of Repositories not allowed anymore|`true`|
|`initial.mailSender`|Initial Configuration of the mail sender|`redmine@example.net`|
|`fetchCommits`|Should changesets get fetched via cron? One of: hourly, daily or monthly|`disable`|

> **NOTE**: The persistence settings are right now rather useless (except the path), since we are not using any persistence claim, we are still using hostpath

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-redmine -f values.private.yaml redmine-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

The initial Username/Pasword combination for the first login is: `admin/admin`.

## Persistence

To be able to keep stateful data in the redmine kubernetes container, the following path is used:

```
/data/redmine/data
```

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

## Initial login

Username: admin
Password: admin

# Todo

* Adopt persistence to be able to run this in the cloud as well as on single node "clusters"
* Update to a later version of MariaDb
* Use LDAP and SSO
