#!/bin/bash
sudo kubeadm reset -y
sudo rm -rf /etc/cni/net.d
sudo iptables -F