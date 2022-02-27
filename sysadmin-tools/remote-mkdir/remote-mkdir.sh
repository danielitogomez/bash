#!/bin/bash

# Uncomment this line to run the script in debug mode
#set -x 

# Declare variables

SSH_PUB_KEY="$HOME/.ssh/id_rsa_remote_server"
USER="cloud_user"
SERVER="34.218.222.169"
CMD="mkdir /home/cloud_user/$(date +%Y-%m-%d)$(date +%H%M%S)"
STATUS=$?
PORT=22
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H%M%S)

# Functions

server_conection_status_port_22 () {
	echo "####Testing connection to remote server $SERVER...####"
if [ "$(nc -z -w3 $SERVER $PORT; echo $?)" -eq 0 ]; then
	echo "At $DATE $TIME The server $SERVER on port $PORT: Connected"
else
	echo "At $DATE $TIME The server $SERVER on port $PORT : No connection"
	exit 1
fi
}

exit_status () {
if [ $STATUS = 0 ]; then
	echo "Creating directory..."
else
	echo "Cannot create directory..."
	exit 1
fi
}

function_remote_server () {
	echo "Connecting to remote server...";
if [ "$(ssh -i $SSH_PUB_KEY $USER@$SERVER "$CMD"; echo $?)" = "0" ]; then
	echo "Connecting success..."
	exit_status
else
	echo "Unsucess conection..."
	exit 1
fi
}

# Functions call

server_conection_status_port_22 && function_remote_server




