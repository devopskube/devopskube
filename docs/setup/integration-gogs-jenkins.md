# Integration Jenkins / Gogs

In the current implementation, there is no client to create Gogs repositories and the corresponding Jenkins Jobs. In our Docker Images ([MySql](https://github.com/devopskube/docker-mysql) as well as [Jenkins](https://github.com/devopskube/docker-jenkins)) we do provide already some naiv Jenkinsfile implementations. Those will (in the future) be replaced with slightly more advanced ones. Still the integration is not only on the Jenkins Side, but also on the Gogs-side.

How to integrate those two products is documented in here.

## Gogs Repository

We do assume that Gogs is setup correctly using our chart.

* Add ssh-keys to your user
* create a new Repository (in the future, the repository will be named after the project, so stick with this convention)
* Add a new User (jenkins) and assign ssh-key (by login in with the user jenkins)
* Add the above mentioned user as a collaborator to the Repository


## Jenkins Job

* Create a job using the name of the above mentioned repository (eg. docker-mysql)
* Add repository to job, using ssh, and (if new) a newly created creditial using the private key of the user (which is added in the step above to the repository)
* Since the jenkinsfile uses some "approveable" methods, the pipeline needs to run once, and then needs to get approved in Jenkins -> ScriptApproval
