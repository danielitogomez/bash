#!/bin/bash
#Master Node

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

#Config Master Node
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config && kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml