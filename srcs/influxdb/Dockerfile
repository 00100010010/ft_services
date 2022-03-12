FROM        alpine:3.13.2

RUN			echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN         apk add influxdb telegraf

RUN         mkdir /etc/influxdb
RUN         mkdir /var/lib/influxdb
RUN         chown -R influxdb:influxdb /var/lib/influxdb

RUN         mkdir /etc/telegraf
COPY        srcs/telegraf.conf	/etc/telegraf/telegraf.conf

COPY        /srcs/influxdb.conf /etc/influxdb.conf

COPY        /srcs/start.sh		/

EXPOSE      8086

ENTRYPOINT  sh start.sh
