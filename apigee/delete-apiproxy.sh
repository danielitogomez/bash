#!/bin/bash

# Set variables

USER=""
PASS=""
ORG=""
API_Proxies=""

# Set functions

delete_api_proxies () {	
	for apis in $API_Proxies; do
                echo "Deleting API Proxies..."
                        apigeetool delete -u $USER -p $PASS -o $ORG -n $apis
                        if [ $? -eq 0 ]; then
                                echo "Api Proxies were delete"
                        else
                                echo "One or more api proxies had a problem with action delete"
                                exit 1
                        fi
        done
}

install_apigeetool () {
	npm install -g apigeetool
}

install_node () {
	nvm ls && nvm install --lts
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
					echo "Installing nvm..."
					curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
				else
					sudo apt-get install curl -y && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && install_node
				fi
		else
			echo "Installing latest stable LTS Node..."
			install_node
		fi
	else
		echo "Installing apigetool and delete proxies..."
		install_apigeetool && delete_api_proxies
	fi
else
	delete_api_proxies
fi
