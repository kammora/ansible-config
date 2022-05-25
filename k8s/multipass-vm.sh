# -d disk -m memory
multipass launch --name myname -d 10G -m 2G --cpus 4 --network name=omga -v

# run on 
yes ubuntu | sudo passwd ubuntu; sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config; sudo systemctl restart sshd
sudo sed -i 's/^PasswordAuthentication no/#PasswordAuthentication no/' /etc/containerd/config.toml
