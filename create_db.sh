#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <db_name>"
	exit 1
fi

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -h$DBHOST -u$DBUSER -p$DBPASS -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating database $1"
# Vérification de l'existence de la base de données
if mysql -h$DBHOST -u$DBUSER -p$DBPASS -e "USE $1" 2>/dev/null; then
    echo "Can't create database $1 database exists"
else
	RET=1
	while [[ RET -ne 0 ]]; do
		sleep 5
		
		mysql -h$DBHOST -u$DBUSER -p$DBPASS  -e "CREATE DATABASE $1"
		RET=$?
	done
fi

#mysqladmin -h$DBHOST -u$DBUSER -p$DBPASS shutdown

echo "=> Done!"

