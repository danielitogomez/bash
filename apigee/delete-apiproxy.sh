#!/bin/bash

# Set variables

USER=""
PASS=""
ORG=""
API_Proxies=""

delete_api_proxies () {	
	for apis in $API_Proxies; do
                echo "Deleting APIs..."
                        apigeetool delete -u $USER -p $PASS -o $ORG -n $apis
                        if [ $? -eq 0 ]; then
                                echo "APIs were delete"
                        else
                                echo "One or more APIs had a problem with action delete"
                                exit 1
                        fi
        done
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
					sudo apt-get install curl -y && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
				fi
		else
			echo "Installing latest stable LTS Node..."
			nvm ls && nvm install --lts
		fi
	else
		echo "Installing apigetool..."
		npm install -g apigeetool && delete_api_proxies
	fi
else
	delete_api_proxies
fi
