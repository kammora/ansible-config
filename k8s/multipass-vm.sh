# -d disk -m memory
multipass launch --name myname -d 10G -m 2G --cpus 4 --network name=omga -v

# run on 
yes ubuntu | sudo passwd ubuntu; echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config; sudo systemctl restart sshd