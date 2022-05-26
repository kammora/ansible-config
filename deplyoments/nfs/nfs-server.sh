#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04


shareFolderPath="/share"

sudo apt update

sudo apt install nfs-kernel-server

sudo systemctl start nfs-kernel-server.service

sudo mkdir -p $shareFolderPath
sudo chown nobody:nogroup $shareFolderPath

#echo "$shareFolderPath *(rw,sync,all_squash)" | sudo tee -a /etc/export
echo "$shareFolderPath *(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

sudo exportfs -a
sudo systemctl restart nfs-kernel-server.service
sudo ufw disable # TODO