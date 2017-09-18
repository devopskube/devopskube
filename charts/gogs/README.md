# Gogs - Go Git Service

[Gogs](https://gogs.io/) is a painless self-hosted Git service. It is used in our environment to allow an easy management of Git-Repositories.

Right now we do use version 0.11.29.

## Chart Details

This chart uses the [Docker image](https://hub.docker.com/r/gogs/gogs/) provided by gogs itself. Furthermore it has a requirement on our Mysql-Chart to provide a datastore.

## Get this Chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the chart

If you have cloned this repository, you do need to update the requirements of this chart beforehand via `helm dependencies update` in the chart-folder.

Other installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the Gogs chart and their default values.

|Parameter|Description|Default|
|---------|-----------|-------|
| `domainName`|Domain Name of this Gogs Instance|`example.com`|
| `hostName`|Host Name of this Gogs Instance|`gogs.example.com`|
| `httpContainerPort`|HTTP Port of gogs in the container|`3000`|
| `sshContainerPort`|SSH Port of gogs in the container|`2222`|
| `skipTlsVerify`|Should TLS certificate verification be skipped for webhooks|`true`|
| `startSshServer`|Should the SSH-Server of gogs be startet|`true`|
| `secretKey`|Secret Key for private data encryption (Should be changed)|`!#@FDEWREWR&*(`|
| `mailer.enabled`|Should the Mailer-Service be enabled|`false`|
| `mailer.heloHostname`|HostName for Helo|`gogs.example.com`|
| `mailer.host`|SMTP Server including Port|`smtp.example:587`|
| `mailer.from`|From Address|`gogs@example.com`|
| `mailer.user`|User for SMTP (usually an email-address)|`gogs@example.com`|
| `mailer.passwd`|SMTP Password|`averysecretpassword`|
| `mailer.skipVerify`|Skip certificate verification|`false`|
| `log.rootPath`|path where logs are stored in gogs|`/data/gogs/log`|
| `server.appDataPath`|path where gogs app data is stored|`/data/gogs/data`|
| `server.sshRootPath`|path where ssh-data is stored|`/data/ssh`|
| `repository.root`|path where the git repositories on the guest are stored|`/data/git`|
| `attachment.path`|path where attachments are stored|`/data/gogs/data/attachments`|
| `session.providerConfig`|session data is stored here|`/data/gogs/data/sessions`|
| `picture.avatarUploadPath`|avatar storeage path|`/data/gogs/data/avatars`|
| `persistence.dataPath`|Path on the host, where gogs stores data|`/data/gogs/data`|
| `databaseType`|The databaseType `mysql`. `postgres` or `sqlite3`|`mysql`|
| `mysql.databaseName`|The name of the database|`gogs`|
| `mysql.databaseUser`|The database user|`gogs`|
| `mysql.databasePassword`|The password of the database|`gogs`|
| `mysql.persistence.path`|the path where the mysql stores the data on the  node|`/data/gogs/mysql`|

> **NOTE**: If you do change the sshContainerPort, you also have to change this port in the nginx-ingress-controller.

Further configuration settings can easily added in the deployment.yaml file and/or in the configmap-gogs.yaml. Please have a look on the Gogs [configuration cheat sheet](https://gogs.io/docs/advanced/configuration_cheat_sheet.html) for a detailed explanation of settings.

Specify each parameter using the --set key=value[,key=value] argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-gogs -f values.private.yaml gogs-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

To be able to keep stateful data in the gogs kubernetes container, the following path is used:

```
/data/gogs/data
```

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

## Initial Login

The first user, registered into gogs is going to be the Admin User.

## Connect to the gogs instance

The gogs Instance can be reached via the configure URL and the corresponding port (port: 443 for SSL, port: 2222 (sshContainerPort) for ssh). Therefor using the above mentioned default configuration, the gogs instance is then reachable via:

```
http://gogs.example.com/
ssh://git@gogs.example.com:2222/
```


# Todo

* Adopt persistence to be able to run this in the cloud as well as on single node "clusters"
* Update to a later version of MariaDb
