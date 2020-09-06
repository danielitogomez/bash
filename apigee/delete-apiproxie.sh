#!/bin/bash

USER=""
PASS=""
ORG=""
API_Proxies=""

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
