#!/bin/bash
set -e

PASS="k<(3!BKN"

mysql --host=localhost --user=root -p <<MYSQL_SCRIPT
CREATE USER '$1'@'localhost' IDENTIFIED BY '$PASS';
GRANT SELECT ON *.* TO '$1'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   $1"
echo "Password:   $PASS"
