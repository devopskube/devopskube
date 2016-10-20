# Jenkins Helm Chart

Jenkins master and slave cluster utilizing the Jenkins Kubernetes plugin

* https://wiki.jenkins-ci.org/display/JENKINS/Kubernetes+Plugin

Inspired by the awesome work of Carlos Sanchez <carlos@apache.org>

This chart is fully based on the chart found at the [Kubernetes Charts](https://github.com/kubernetes/charts/tree/master/stable/jenkins).

## Chart Details

This chart will do the following:

* 1 x Jenkins Master with port 80 exposed on an external LoadBalancer
* All using Kubernetes Deployments

Right now, we are using Jenkins 2.7.4.

## Get this chart

Our central repository is located at: `https://devopsku.be/charts`, please configure this in your helm installation (via `helm repo add`). Then you can download and install this chart using the usual helm procedure (see [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md)).

If you would like to contribute and/or like to make changes on this chart, please clone this repo via:

`git clone https://github.com/devopskube/devopskube.git`

## Installing the Chart

The installation-instructions can be found on the above mentioned [Using Helm](https://github.com/kubernetes/helm/blob/master/docs/using_helm.md) page.

## Configuration

The following tables lists the configurable parameters of the Jenkins chart and their default values.

### Jenkins Master

|       Parameter       |           Description            |                         Default                          |
|-----------------------|----------------------------------|----------------------------------------------------------|
|`master.name`| Jenkins master name | `jenkins-master` |
|`master.image`| Master image name  | `gcr.io/kubernetes-charts-ci/jenkins-master-k8s` |
|`master.imageTag`| Master image tag | `v0.1.0` |
|`master.imagePullPolicy`| Master image pull policy | `Always` |
|`master.vomponent`| k8s selector key  | `jenkins-master` |
|`master.cpu`| Master requested cpu | `200m` |
|`master.memory`| Master requested memory | `256Mi` |
|`master.servicePort`| k8s service port | `80` |
|`master.containerPort`| Master listening port | `8080` |
|`master.slaveListenerPort`|  Listening port for agents | `50000` |
|`master.adminUser`| The initial admin user | `admin` |
|`master.adminPassword`| The initial admin user password | `admin1234` |
|`master.javaOpts`| Some java options | `-Xms512m -Xmx512m` |
|`master.hostName`| The hostName of the jenkins instance | `jenkins.example.com` |
|`persistence.path`| The path where data is stored | `/data/jenkins` |


### Jenkins Agent

|       Parameter       |           Description            |                         Default                          |
|-----------------------|----------------------------------|----------------------------------------------------------|
|`agent.image`| Agent image name | `jenkinsci/jnlp-slave` |
|`agent.imageTag`| Agent image tag | `2.52` |
|`agent.cpu`| Agent requested cpu | `200m` |
|`agent.memory`| Agent requested memory | `256Mi` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-jenkins -f values.yaml jenkins-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](https://github.com/devopskube/devopskube/blob/master/charts/jenkins/values.yaml)

## Persistence

To be able to keep stateful data in the jenkins kubernetes container, the following path is used:

```
/data/jenkins
```

Right now, we do use HostPathes, which do not work in a real cluster environment (like AWS or GCE). Please adopt this one to your own needs.

# Todo

* Enable Docker-in-Docker or Docker-on-Docker support on the Jenkins agents
* Add SSO
* Use persistence volume claims
