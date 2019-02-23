# Setup Minikube "Cluster"

For testing purposes, it is mostly easier to just use a local minikube.

We do use KVM as the driver for minikube. This is just possible on Linux devices. 
You are still able to use other drivers, if wanted. 

For a detailed setup on Archlinux (a real nice Linux Distro), #
please have a look at http://blog.programmableproduction.com/2018/03/08/Archlinux-Setup-Minikube-using-KVM/. 
The following steps are taken from this page, and do work for us:

```
sudo pacman -Sy libvirt qemu ebtables dnsmasq
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.service 
sudo pacman -Sy docker-machine

yay -Sy minikube-bin kubectl-bin  
yay -Sy docker-machine-driver-kvm2  

yaourt -Sy docker-machine-driver-kvm2  

# restart terminal session 

minikube start --vm-driver kvm2
```

Minikube will create a “minikube” context, and set it to default in kubectl. 
To switch back to this context if it changed, run: 

```
kubectl config use-context minikube.
```
