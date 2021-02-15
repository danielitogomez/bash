#!/bin/bash
#Working Node

showHelp()
{
    echo "Hi, please use flag -u and the version that you want to update"
    echo "For example: ./update-kubernetes-version-working-node -u 1.18.5-00"
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


sudo apt-mark hold kubectl && sudo apt install -y "kubelet=$update" && sudo apt-mark hold kubelet

#Check Version
echo "Kubelet Version: "
kubelet --version