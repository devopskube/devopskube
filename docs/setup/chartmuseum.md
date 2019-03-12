# Setup chartmuseum

Chartmuseum is an open-source Helm Chart Repository, for more details see it's [Homepage](https://github.com/helm/chartmuseum).

## Install

The installation is described in detail on it's [Homepage](https://github.com/helm/chartmuseum), here just a short 
instruction, line by line:

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install stable/chartmuseum
```

Please note, that to install chartmuseum, helm should be already installed on your kubernetes cluster.

For testing purposes, the following commands can be used, to access the POD with a browser:

```
export POD_NAME=$(kubectl get pods --namespace default -l "app=chartmuseum" -l "release=knotted-ibex" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:8080 --namespace default
```

If you are using minikube, the url is usually something like ```localhost:8080```.

