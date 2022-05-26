#!/bin/bash

shareFolderPath="/share"

sudo apt update

sudo apt install nfs-kernel-server

sudo systemctl start nfs-kernel-server.service

sudo mkdir -p $shareFolderPath

cat "$shareFolderPath *(rw,sync,subtree_check)" | sudo tee -a /etc/export

sudo exportfs -a