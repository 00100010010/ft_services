#!/bin/sh

telegraf --config /etc/telegraf/telegraf.conf &
vsftpd /etc/vsftpd/vsftpd.conf &

sleep 1.8 &&

while true;
do
	if ! pgrep vsftpd >/dev/null 2>&1 ; then
		echo "vsftpd : [down]"
		exit 1
	elif ! pgrep telegraf >/dev/null 2>&1 ; then
		echo "telegraf : [down]"
		exit 1
	fi
done
