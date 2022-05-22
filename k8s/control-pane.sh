#!/bin/bash

sudo bash ../sudo_nopasswd.sh

sudo apt update
sudo apt install ansible -y

ansible-playbook ../zsh_install.yml
ansible-playbook ../docker_install.yml
ansible-playbook ../utils_install.yml
zsh

sudo bash ./kubeadm

sudo systemctl containerd restart

# --service-cidr string     Default: "10.96.0.0/12"
kubeadm init