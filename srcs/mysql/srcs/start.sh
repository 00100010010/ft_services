#!/bin/sh

telegraf &
mariadb-install-db -u root
mysqld -u root & sleep 5
mysql -u root --execute="CREATE DATABASE wordpress;"
mysql -u root wordpress < wordpress.sql
mysql -u root --execute="CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

while true;
do
	if ! pgrep mysql >/dev/null 2>&1 ; then
		echo "mysql : [down]"
		exit 1
	elif ! pgrep telegraf >/dev/null 2>&1 ; then
		echo "telegraf : [down]"
		exit 1
	fi
done
