#!/bin/sh

telegraf &
influxd run -config /etc/influxdb.conf &

sleep 1.8 &&

while true;
do
	if ! pgrep influx >/dev/null 2>&1 ; then
		echo "influxdb : [down]"
		exit 1
	elif ! pgrep telegraf >/dev/null 2>&1 ; then
		echo "telegraf : [down]"
		exit 1
	fi
done
