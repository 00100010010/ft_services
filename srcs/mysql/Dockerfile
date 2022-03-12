FROM					alpine:3.13.2

RUN						echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN						apk add mariadb mariadb-client telegraf

RUN						mkdir /etc/telegraf
COPY					/srcs/telegraf.conf		/etc/telegraf/telegraf.conf

RUN						mkdir -p /run/mysqld/
COPY					/srcs/my.cnf			/etc/
COPY					/srcs/wordpress.sql		/

COPY					/srcs/start.sh			/

EXPOSE					3306

ENTRYPOINT				sh start.sh
