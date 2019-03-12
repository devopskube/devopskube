# Setup monocular

Monocular is an open-source web-based Chart Repository Client, for more details see it's [Homepage](https://github.com/helm/monocular).

## Install

The installation is described in detail on it's [Chart Page](https://github.com/helm/monocular/tree/master/chart/monocular), here just a short 
instruction, line by line:

```
helm repo add monocular https://helm.github.io/monocular
helm install monocular/monocular
```

Please note, that to install monocular, helm should be already installed on your kubernetes cluster.
