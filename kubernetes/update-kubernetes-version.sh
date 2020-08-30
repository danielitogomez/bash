#!/bin/bash
  
while test $# -gt 0; do
           case "$1" in
                -u)
                    shift
                    update=$1
                    shift
                    ;;
                -h)
                    shift
                    update=$1
                    echo "============Help============="
                    echo "Use flag -u for input the version of kube{adm,ctl,let}"
                    exit 1
                    ;;
                 *)
                    echo "Not a recognized flag! please use flag -h for view the help"
                    exit 1
                    ;;
          esac
  done

#Update kubeadm
kubeadm version
sudo apt-mark unhold kubeadm kubelet && sudo apt install -y "kubeadm=$update"

if [ $? -eq 0 ]; then
    echo "=========Go to hold kubeadm============"
                sudo apt-mark hold kubeadm
    echo "======================================="      
        if [ $? -eq 0 ]; then
            sudo kubeadm upgrade plan
            echo "===============Go to upgrade apply================"
            #Version Definition
            var_version=$(echo $update | awk '{print substr($0, 1, length($0)-3)}')
            sudo kubeadm upgrade apply v$var_version -y
                if [ $? -eq 0 ]; then
                    echo "Apply kubeadm finish Good"
                    kubeadm version
                else
                    echo "Can't apply kubeadm"
                    exit 1
                fi
        else
            exit 1
        fi
else
    echo "Can't full update kubeadm"
    exit 1
fi

#Update kubectl
sudo apt-mark unhold kubectl && sudo apt install -y "kubectl=$update"

if [ $? -eq 0 ]; then
    echo "=========Go to hold kubectl============"
                sudo apt-mark hold kubectl
    echo "======================================="
        if [ $? -eq 0 ]; then
            echo "Update kubectl finish Good"
        else
            echo "Can't update kubectl"
            exit 1
        fi
else
    echo "Can't full update Kubectl"
    exit 1
fi

#Update kubelet
sudo apt install -y "kubelet=$update"

if [ $? -eq 0 ]; then
    echo "=========Go to hold kubelet============"
                sudo apt-mark hold kubelet
    echo "======================================="
        if [ $? -eq 0 ]; then
            echo "Update kubelet finish Good"
        else
            echo "Can't update kubelet"
            exit 1
        fi
else
    echo "Can't full update kubelet"
    exit 1
fi

echo "========Present Versions========="
kubectl version --short
kubeadm version
kubelet --version
echo "================================="
