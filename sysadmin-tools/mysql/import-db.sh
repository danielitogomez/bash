#!/bin/bash

# Variables

DB_USER=""
DB_HOST=""
DB_PASSWORD=""
DB_PORT=""

# Functions Reads

function Read_DB_Schema () {
 read -p "===> ** Input DB Schema: " DB_SCHEMA
}

function Read_DB_Data () {
 read -p "===> ** Input DB Data: " DB_DATA
}

function Read_DB_Name () {
 read -p "===> ** Input DB Name: " DB_NAME
}

function Read_DB_Test () {
 read -p "===> ** Input DB Test " DB_TEST
}

function Read_Create_User () {
 read -p "===> ** Input User to Create: " CREATE_USER
}

function Read_Grant_User () {
 read -p "===> ** Input User to Grant Permission: " GRANT_USER
}

function Read_DB_Grant_User () {
 read -p "===> ** Input DB to Grant Permission: " DB_GRANT_USER
}

function Read_Table_Grant_User () {
 read -p "===> ** Input Table to Grant Permission: " TABLE_GRANT_USER
}

function Read_Select_User () {
 read -p "===> ** Input User to Select: " SELECT_USER
}

function Read_DB_Backup () {
 read -p "===> ** Input DB to Backup: " BACKUP_DB
}

function Read_DB_Backup_Table () {
 read -p "===> ** Input Table to Backup: " BACKUP_TABLE
}

# Functions DBs

function DB_Import_Schema () {
 echo "===> ** Importing DB Schema"
mysql -u $DB_USER -h $DB_HOST -p$DB_PASSWORD --port $DB_PORT < $DB_SCHEMA
}

function DB_Import_Data () {
 echo "===> ** Importing Data into DB"
mysql -u $DB_USER -h $DB_HOST -p$DB_PASSWORD --port $DB_PORT $DB_NAME < $DB_DATA
}

function DB_Test () {
 echo "===> ** Testing DB Schema"
mysql -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD -t < $DB_TEST
}

function DB_Create_User () {
 echo "===> ** Creating DB User"
mysql -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD -sN -e "CREATE USER '$CREATE_USER'@'$DB_HOST' IDENTIFIED BY 'password';"
}

function DB_Grant_User () {
 echo "===> ** Granting DB User"
mysql -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD -sN -e "GRANT ALL PRIVILEGES ON $DB_GRANT_USER.$TABLE_GRANT_USER TO '$GRANT_USER'@'$DB_HOST'; FLUSH PRIVILEGES;"
}

function DB_Select_All_User () {
 echo "===> ** Selecting DB Users"
mysql -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD -sN -e "SELECT USER FROM mysql.user\G;"
}

function DB_Select_User () {
 echo "===> ** Selecting DB User"
mysql -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD -sN -e "SELECT USER FROM mysql.user where user='$SELECT_USER';"
}

function DB_Backup_All () {
 echo "===> ** Backup All DBs"
mysqldump -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD --all-databases > db_backup_all.sql
}

function DB_Backup_Table () {
 echo "===> ** Backuping DB Table"
mysqldump -u $DB_USER -h $DB_HOST --port $DB_PORT -p$DB_PASSWORD $BACKUP_DB > db_$BACKUP_DB$BACKUP_TABLE.sql
}

# Logic case

PS3="Select the operation: "

 echo "===> ** Select if you want to import Database or Data import"

select opt in DB_import_schema DB_import_data DB_test DB_create_user DB_grant_user DB_select_all_users DB_select_user DB_backup_all DB_backup_table help quit; do
	
	case $opt in
		DB_import_schema)
			Read_DB_Schema; DB_Import_Schema && exit 0
			;;
		DB_import_data)
			Read_DB_Name; Read_DB_Data; DB_Import_Data && exit 0
			;;
		DB_test)
			Read_DB_Test; DB_Test && exit 0
			;;
		DB_create_user)
			Read_Create_User; DB_Create_User && exit 0
			;;
		DB_grant_user)
			Read_DB_Grant_User; Read_Table_Grant_User; Read_Grant_User; DB_Grant_User && exit 0
			;;
		DB_select_all_users)
			DB_Select_All_User && exit 0
			;;
		DB_select_user)
			Read_Select_User; DB_Select_User && exit 0
			;;
		DB_backup_all)
			DB_Backup_All && exit 0
			;;
		DB_backup_table)
			Read_DB_Backup; Read_DB_Backup_Table; DB_Backup_Table && exit 0
			;;
		help)
			echo "*** This is a help: select 1-) to import your new schema, select 2-) to import your data to whatever DB, select 3-) to output this help and 4-) to quit ***"
			;;
		quit)
			echo "===> ** Exit script..."
			break
			;;
		*)
			echo "===> ** Invalid operation $REPLAY- please select 1 to 4"
			;;
	esac
done


