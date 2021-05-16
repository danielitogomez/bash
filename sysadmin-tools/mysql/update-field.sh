#!/bin/bash

### Variables

USER=$1
HOST=$2
DB=""
STATE=""
DB_STATE=""
DB_TABLE=""

### Login's Array

declare -a LOGIN=("")

### Validations

if [ -z "$DB" ]; then
	echo "$DB is empty"
else
	for db in $DB; do
		if [ -z "$LOGIN" ]; then
			echo "$LOGIN is empty"
		else

### Update State

			for login in ${LOGIN[*]}; do
				mysql -u $USER -h $HOST $DB -p -sN -e "update $DB_TABLE set $DB_STATE='$STATE' where login='$login'; select * from $DB_TABLE where login='$login'\G;"
				if [ $? -ne 0 ]; then
					echo "Command failed"; exit 1
				else
					echo "Update Database Ok"
				fi
			done
		fi
	done
fi