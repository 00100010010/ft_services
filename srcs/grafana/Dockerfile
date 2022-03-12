FROM        alpine:3.13.2

RUN         echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN         apk add grafana telegraf

RUN         mkdir /etc/telegraf
COPY        srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY         srcs/datasources/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY         srcs/dashboards/* /usr/share/grafana/conf/provisioning/dashboards/

COPY        /srcs/start.sh /

EXPOSE      3000

ENTRYPOINT  sh start.sh
