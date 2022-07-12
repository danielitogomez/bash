#!/bin/bash

# Variables

DB_USER=""
DB_HOST=""
DB_PASSWORD=""
DB_PORT=""

# Functions

function_read_DB_schema () {
 read -p "===> ** Input DB Schema: " DB_SCHEMA
}

function_read_DB_Data () {
 read -p "===> ** Input DB Data: " DB_DATA
}

function_read_DB_name () {
 read -p "===> ** Input DB Name: " DB_NAME
}

function_DB_import_schema () {
echo "===> ** Importing Database Schema"
mysql -u $DB_USER -h $DB_HOST -p$DB_PASSWORD --port $DB_PORT < $DB_SCHEMA
}

function_DB_import_data () {
echo "===> ** Importing Data into Database"
mysql -u $DB_USER -h $DB_HOST -p$DB_PASSWORD --port $DB_PORT $DB_NAME < $DB_DATA
}

# Logic case

PS3="Select the operation: "

echo "===> ** Select if you want to import Database or Data import"

select opt in DB_import_schema DB_import_data quit; do
	
	case $opt in
		DB_import_schema)
			function_read_DB_schema
			function_DB_import_schema && exit 0
			;;
		DB_import_data)
			function_read_DB_name; function_read_DB_Data; function_DB_import_data && exit 0
			;;
		quit)
			echo "===> ** Exit script..."
			break
			;;
		*)
			echo "===> ** Invalid operation $REPLAY - please select 1 to 3"
			;;
	esac
done


