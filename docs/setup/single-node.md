# Single Node CoreOS and Kubernetes Install

[CoreOS](https://coreos.com/) is the Host System we are using for the kubernetes installation. Since we are using CoreOS on a single-node (right now), in the following, you can find a description on how to setup a CoreOS single-node cluster. We are using a KVM-Base at [netcup](https://www.netcup.de/), but any other Hoster should work fine as well.

In the following, I am trying to re-play, what I did and provide some links and useful information on how to make this one work.

## Install CoreOS

Most of the following was taken from [The Hyperpessimist](https://xivilization.net/~marek/blog/2014/08/04/installing-coreos/).
I chose the usual Ubuntu-Image, which is offered by netcup as a base to be able to install coreos.

``
wget https://raw.github.com/coreos/init/master/bin/coreos-install
``

To install CoreOS in a "non-cloud" environment like netcup, you do need to provide an adopted
cloud-config. This is included in this repository. To be able to use this config-file, you do
need to upload it to a server, where you can fetch this file via a wget, so that coreos can
use it.

``
wget https://raw.github.com/triplem74/kubernetes-netcup/master/cloud-config.yml
``

Afterwards the CoreOS installer can be called using the following commands:

``
chmod u+x coreos-install
bash coreos-install -d /dev/vda -C alpha -c cloud-config.yml
``

Could be, that you have to provide the above mentioned cloud-config.yml again
during the install as an http-link again. Furthermore I needed to copy the
cloud-config file to a specific location, so that it could be loaded after a
reboot again, see [CoreOS Issue 100](https://github.com/coreos/bugs/issues/100).

``
sudo cp cloud-config.yml /var/lib/coreos-install/user_data
sudo coreos-cloudinit --from-file /var/lib/coreos-install/user_data
``

## Install kubernetes

To install kubernetes on a single-node, I followed the [CoreOS - Single-Node Kubernetes Installation](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant-single.html). This installation description is
mainly for vagrant, but since we do have a single-node install as well, this fits quite nicely.

### Prepare Installation

Before we do setup kubernetes, we do need some SSL certificates. This can be done using the scripts in the
repository mentioned in the above description [CoreOS - Single-Node Repository (scripts)](https://github.com/coreos/coreos-kubernetes/tree/master/lib).
All of this should happen on the local machine.

Note: Those scripts are in this local repository as well, but those are not updated regularly, so in case
of errors or questions, I cannot really help you.

The IP.1 should be the Public IP of the CoreOS host (eg. 8.8.8.8), the IP.2 should be the Internal IP of the
CoreOS host, which is defined in the Cloud-Config-file above.

``
./init-ssl-ca ssl
./init-ssl ssl apiserver controller IP.1=<PUBLIC_IP_HOST>,IP.2=172.17.0.1
./init-ssl ssl admin kube-admin
``

The generated files are then copied to the CoreOS host:

``
scp -r ssl core@<PUBLIC_IP_HOST>:/home/core
``

Then on the remote machine (CoreOS host), those files need to get moved to the correct location:

``
sudo tar -C /etc/kubernetes/ssl -xf ssl/controller.tar
``

### Start Installation

To start the installation, the user_data from the [CoreOS-repository](https://github.com/coreos/coreos-kubernetes/blob/master/single-node/user-data)
has to be adopted and copied to the remote host. Afterwards it can get executed and the install is basically done.

Note: I have adopted this file, which can be found in the current repository.

Ĉopy the user data to the remote host:

``
scp user_data core@<PUBLIC_IP_HOST>:/home/core
``

Move the User-Data on the remote host to the correct location and execute it:

``
sudo mkdir -p /var/lib/coreos-kubernetes
sudo cp /home/core/user_data /var/lib/coreos-kubernetes/user_data
sudo /var/lib/coreos-kubernetes/user_data
``

### Execute kubectl

To be able to execute kubectl on your local machine, you have to provide a valid kubeconfig. There is
one in this repository, but it needs to get adopted. Afterwards, you are able to use the following
commands:

export KUBECONFIG="${KUBECONFIG}:$(pwd)/kubeconfig"
kubectl config use-context netcup

### Add useful pods

#### Pre-Requisite (SSL-Login-Certificate)

To be able to login to the following pods, k18s expects you to have an certificate. This can be
generated using the already created ssl-certificates:

``
openssl pkcs12 -export -in ./ssl/admin.pem -inkey ./ssl/admin-key.pem -out ./ssl/admin.p12
``

Afterwards you have to import the generated file into chromium using the used password.

#### Kubernetes Dashboard (Management)

We are going to add the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard) the following two
commands should be executed, so that the Administration is helped by a nice web-ui.

``
kubectl create -f addon/da

shboard-controller.yaml
kubectl create -f addon/dashboard-service.yaml
``

Afterwards the Dashboad can be reached on the URL:

``
https://<PUBLIC_IP_HOST>/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#/replicationcontrollers
``

Please note, that to be able to login to the above mentioned dashboard, the Certificate should be
imported in Chrome.

#### Kubernetes Dash (Monitoring)

To show the Monitoring information, the [Kubernetes Dash](https://github.com/kubernetes/kubedash) should
be installed using the following command:

``
kubectl create -f addon/kubedash-config.yaml
``

Afterwards the Monitoring can be reached via the following URL:

``
https://<PUBLIC_IP_HOST>/api/v1/proxy/namespaces/kube-system/services/kubedash/#!/
``

Please note, that to be able to login to the above mentioned dash, the Certificate should be
imported in Chrome.

#### Service-LoadBalancer --> replaced by Ingress...

To be able to access services from the outside, Kubernetes uses the Service-Type "Loadbalancer" on
cloud platforms like GCE and/or AWS. This is not available on Vagrant/Bare Metal/Netcup. For this to
work, we do need to use a contrib module called service-loadbalancer (see [Kubernetes Contrib Repository](https://github.com/kubernetes/contrib/tree/master/service-loadbalancer)).

``
kubectl create -f addon/loadbalancer-controller.yml
kubectl label node <PUBLIC_IP_HOST> role=loadbalancer
``

The Public IP of the Host is equal to the Nodename. To gather the Nodenames, please use

``
kubectl get nodes
``

The Service-Loadbalancer has to be configured in the services. Usually the Service-Type defined in Kubernetes-Services are
"LoadBalancer", but the Service-Loadbalancer requires "NodePort". Furthermore there are several types of mappings offered by
the Service-Loadbalancer. Me was interested in the Host-Mapping mainly. There is no example in the documentation of the
annotation used for this, therefor I did some investigations and found the following (see container/redmine/redmine-service.yml):

``
  annotations:
    serviceloadbalancer/lb.host: "<PUBLIC_HOSTNAME>"
``

This makes the service available on the given PUBLIC_HOSTNAME (eg. redmine.example.org).

## TODO

[] Add email possibility for Redmine
[] Make Redmine and other containers SSL-aware
[] Ingress needs 443, blocked by kube-apiserver (/etc/kubernetes/manifests/kube-apiserver.yaml), use port 444 in there and restart kubelet service
