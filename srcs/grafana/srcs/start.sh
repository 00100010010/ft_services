#!/bin/sh

telegraf &
cd /usr/share/grafana
grafana-server > /dev/null &

sleep 1.8 &&

while true;
do
	if ! pgrep grafana-server > /dev/null; then
		echo "grafana : [down]"
		exit 1
	elif ! pgrep telegraf > /dev/null; then
		echo "telegraf : [down]"
		exit 1
	fi
done
