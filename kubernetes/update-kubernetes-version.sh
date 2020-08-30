#!/bin/bash
#Master Node

showHelp()
{
        echo -e "\033[31m           0000\033[0m_____________0000________0000000000000000__000000000000000000+\n\033[31m         00000000\033[0m_________00000000______000000000000000__0000000000000000000+\n\033[31m        000\033[0m____000_______000____000_____000_______0000__00______0+\n\033[31m       000\033[0m______000_____000______000_____________0000___00______0+\n\033[31m      0000\033[0m______0000___0000______0000___________0000_____0_____0+\n\033[31m      0000\033[0m______0000___0000______0000__________0000___________0+\n\033[31m      0000\033[0m______0000___0000______0000_________000___0000000000+\n\033[31m      0000\033[0m______0000___0000______0000________0000+\n\033[31m       000\033[0m______000_____000______000________0000+\n\033[31m        000\033[0m____000_______000____000_______00000+\n\033[31m         00000000\033[0m_________00000000_______0000000+\n\033[31m           0000\033[0m_____________0000________000000000;"
echo "########################################################################"
echo "Hi, please use flag -u and the version that you want to update"
echo "For example: ./update-kubernetes-version.sh -u 1.18.5-00"
}


while getopts "h:u:" OPTION; do
        case $OPTION in
                u)
                        update=$2
                        ;;
                h)
                        showHelp
                        exit 4
                        ;;
                ?)
                        showHelp
                        exit 3
                        ;;
        esac
done

#Update kubeadm
kubeadm version
sudo apt-mark unhold kubeadm kubelet && sudo apt install -y "kubeadm=$update"

if [ $? -eq 0 ]; then
    echo "=========Go to hold kubeadm============"
                sudo apt-mark hold kubeadm
        if [ $? -eq 0 ]; then
                sudo kubeadm upgrade plan
            echo "==============Go to upgrade apply Kubeadm=============="
            
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