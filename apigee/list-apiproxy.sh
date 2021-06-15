#!/bin/bash

# Set variables

USER=""
PASS=""
ORG=""
ENV="
prod
test"

# Set functions

list_api_proxies () {
        for env in $ENV; do
                echo "Listing API Proxies..."
                        apigeetool listdeployments -u $USER -p $PASS -o $ORG -e $env
                        if [ $? -eq 0 ]; then
                                echo "API Proxies $env were list"
                        else
                                echo "There are a problem with action list"
                                exit 1
                        fi
        done
}

install_apigeetool () {
        echo "Installing apigeetool..."
        npm install -g apigeetool
}

install_node () {
        echo "Installing npm..."
        sudo apt-get install npm -y
}

echo "Validating dependecies..."
apigeetool
if [ $? != 2 ]; then
        npm --version
                if [ $? -ne 0 ]; then
                        install_node && install_apigeetool && list_api_proxies
                else
                        install_apigeetool && list_api_proxies
                fi
else
        list_api_proxies
fi