#!/bin/bash

sudo bash ../sudo_nopasswd.sh

sudo apt update
sudo apt install ansible -y

ansible-playbook ../zsh_install.yml
ansible-playbook ../docker_install.yml
ansible-playbook ../utils_install.yml

sudo bash ./containerd.sh

sudo bash ./kubeadm.sh

# --service-cidr string     Default: "10.96.0.0/12"
kubeadm init \
--apiserver-bind-port 8080 --apiserver-advertise-address localhost