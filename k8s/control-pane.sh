#!/bin/bash

# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

sudo bash ../sudo_nopasswd.sh

sudo apt update
sudo apt install ansible -y

ansible-playbook ../zsh_install.yml
ansible-playbook ../docker_install.yml
ansible-playbook ../utils_install.yml

sudo bash ./containerd.sh

sudo bash ./kubetools.sh

# --service-cidr string     Default: "10.96.0.0/12"
sudo kubeadm init \
--pod-network-cidr 10.244.0.0/16 # required for flannel (even with default value)
# --apiserver-bind-port 8080 --apiserver-advertise-address 0.0.0.0

mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

# network plugin (Flannel)
sudo mkdir -p /opt/bin
sudo cp ./flanneld /opt/bin/flanneld
sudo chmod +x /opt/bin/flanneld
# kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f ./kube-flannel.yaml

# allow scheduling pods on control pane (single node cluster)
#  disabling control pane isolation
kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-
