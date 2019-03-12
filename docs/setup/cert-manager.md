# Cert-Manager

[cert-manager](https://github.com/jetstack/cert-manager) is a Kubernetes add-on to automate the management 
and issuance of TLS certificates from various issuing sources.

It replaces kube-lego and is therefor used in this project since March 2019.

## Install Cert-Manager

In the documentation of [cert-manager](https://github.com/jetstack/cert-manager/blob/master/docs/getting-started/install.rst)
some detailed instructions can be found. 

Here are just the commands used without any further explanation:

```
# Install the CustomResourceDefinition resources separately
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/00-crds.yaml

# Create a namespace to run cert-manager in
kubectl create namespace cert-manager

# Disable resource validation on the cert-manager namespace
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v0.7-beta.0 \
  jetstack/cert-manager
  ```
