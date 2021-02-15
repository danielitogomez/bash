#!/bin/bash
#este script debe ser ejecutado como root

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt-get update
apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
apt-mark hold docker-ce
sudo systemctl status docker
