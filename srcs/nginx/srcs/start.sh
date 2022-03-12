#!/bin/sh

telegraf &
nginx -c /etc/nginx/nginx.conf &

sleep 1.8 &&

while true;
do
	if ! pgrep nginx >/dev/null 2>&1
	then
		echo "nginx : [down]"
		exit 1
	elif ! pgrep telegraf >/dev/null 2>&1
	then
		echo "telegraf : [down]"
		exit 1
	fi
done
