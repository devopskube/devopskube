# Roadmap

We decided to use the following Roadmap to be able to provide some useful Components already and to have something to extend on.

Note, that this roadmap is not fixed yet and it could be, that some mentioned features are coming in later versions. This roadmap should just describe the rough idead where DevOpsKube is heading to. Furthermore some tasks are most probably not mentioned and have to be done in some of these versions as well ;-)

## Version 0.1

All Components mentioned on our [Homepage](/) should be provided using MySql. Furthermore the configuration for these components is provided and documented. All necessary steps to setup a single node cluster (based on [CoreOS](https://coreos.com/)) will be documented as well.

Furthermore provide tools/documentation on how to generate the charts and offer a download-area for those.

This will be a pre-liminary version to provide all the components and steps to build up the future "development" environment.

## Version 0.2

Add additional components for eg. SSO and other things, which can be useful in an SDLC Stack:

* [Keycloak](http://www.keycloak.org/) - SSO Solution

Furthermore, we do need to keep the already existing components updated. Right now, several components
are deprecated and replaced by other ones (eg. kube-lego) or are updated to newer versions (eg. Nignx-Ingress).

To keep the install process close to the helm standards, we should use [helmsman](https://github.com/Praqma/helmsman),
which seems to be a sensible choice to provide a process to deploy DevOpsKube in a cluster.

## Version 0.3

Additional functionality to be able to create projects via a single REST-API call. This is the first version with some unique functionality. The REST-API should include a web-based client as well as a Command-line client.

## Version 0.4

Add additional components to the Stack to provide a fully featured SDLC Stack. These components could be:

* [Gerrit](https://www.gerritcodereview.com/) - Web based code Review
* [Rocket.chat](https://rocket.chat/) - A chat application
* [GitBucket](https://github.com/gitbucket/gitbucket) - An open source Github clone

## Version 0.5

Make all of the components (if upstream allows) HA-able. Furthermore integrate those as much as possible.

## Version 0.6

Be self-hosted. We should eat our own dog-food, therefor we should host this project on our own Kubernetes Cluster. We do look for a in-expensive Hosting solution here. Do you like to offer your Hosts?
