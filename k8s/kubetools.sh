#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
# completions
cat ~/.zshrc > /dev/null && kubectl completion zsh >> ~/.zshrc && source ~/.zshrc
cat ~/.bashrc > /dev/null && kubectl completion bash >> ~/.bashrc && source ~/.bashrc
cat ~/.zshrc > /dev/null && kubeadm completion zsh >> ~/.zshrc && source ~/.zshrc
cat ~/.bashrc > /dev/null && kubeadm completion bash >> ~/.bashrc && source ~/.bashrc