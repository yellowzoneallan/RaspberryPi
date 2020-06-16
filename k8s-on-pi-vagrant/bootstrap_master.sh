#!/bin/bash
sudo kubeadm init --apiserver-advertise-address=192.168.3.100
mkdir /home/vagrant/.kube
sudo cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
kubeadm token create --print-join-command > /tmp/joincluster.sh
curl -L "https://get.helm.sh/helm-v3.2.3-linux-amd64.tar.gz" -o helm-v3.2.3-linux-amd64.tar.gz
gunzip helm-v3.2.3-linux-amd64.tar.gz
tar xf helm-v3.2.3-linux-amd64.tar
rm helm-v3.2.3-linux-amd64.tar
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64
curl -L https://istio.io/downloadIstio | sh -
sudo cp istio*/bin/istioctl /usr/local/bin/istioctl
