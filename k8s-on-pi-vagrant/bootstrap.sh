#!/bin/bash
sudo cat >>/etc/hosts<<EOF
192.168.3.100 master.example.com master
192.168.3.101 worker1.example.com worker1
192.168.3.102 worker2.example.com worker2
192.168.3.103 worker3.example.com worker3
192.168.3.104 worker4.example.com worker4
192.168.3.105 worker5.example.com worker5
192.168.3.106 worker6.example.com worker6
EOF
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
# sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-focal main" #not ready yet
sudo apt install -y kubeadm kubelet kubectl kubernetes-cni
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab
sudo systemctl enable kubelet
sudo systemctl start kubelet
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl reload sshd
