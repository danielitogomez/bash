#!/bin/bash
#Working Nodes

#Install packages
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Install Docker and kube{let,ctl,adm} version 1.17.8
sudo apt-get update -y && sudo apt-get install -y docker-ce=5:19.03.12~3-0~ubuntu-bionic kubelet=1.17.8-00 kubeadm=1.17.8-00 kubectl=1.17.8-00 && sudo apt-mark hold docker-ce kubelet kubeadm kubectl

#sudo kubeadm join [your unique string from the kubeadm init command] this command is for Join the worker nodes to the cluster
