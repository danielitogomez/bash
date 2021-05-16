#!/bin/bash

# Set variables

USER=""
PASS=""
ORG=""
API_Proxies="
helloworld1
helloworld2
helloworld3"

# Set functions

delete_api_proxies () {
        for apis in $API_Proxies; do
                echo "Deleting API Proxies..."
                        apigeetool delete -u $USER -p $PASS -o $ORG -n $apis
                        if [ $? -eq 0 ]; then
                                echo "API Proxy $apis were deleted"
                        else
                                echo "There are a problem with action delete"
                                exit 1
                        fi
        done
}

install_apigeetool () {
        echo "Installing apigeetool..."
        npm install -g apigeetool
}

install_nvm () {
        echo "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}

install_node () {
        echo "Installing latest stable LTS Node..."
        export NVM_DIR="$HOME/.nvm" && source $NVM_DIR/nvm.sh
        source ~/.nvm/nvm.sh
        source ~/.profile
        source ~/.bashrc
        nvm install --lts && nvm ls
}

install_curl () {
        echo "Installing curl..."
        sudo apt-get install curl -y
}

echo "Validating dependecies..."
apigeetool
if [ $? != 2 ]; then
        npm --version
        if [ $? -ne 0 ]; then
                nvm --version
                if [ $? -ne 0 ]; then
                        echo "Installing dependencies..."
                                curl --version
                                if [ $? -eq 0 ]; then
                                        install_nvm && install_node && install_apigeetool && delete_api_proxies
                                else
                                        install_curl && install_nvm && install_node && install_apigeetool && delete_api_proxies
                                fi
                else
                        install_node
                fi
        else
                install_apigeetool && delete_api_proxies
        fi
else
        delete_api_proxies
fi