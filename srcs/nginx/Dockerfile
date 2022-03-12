FROM		alpine:3.13.2

RUN         echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN         apk add nginx openssl telegraf

RUN         mkdir /etc/telegraf
COPY        srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY        /srcs/nginx.conf			/etc/nginx/nginx.conf
COPY        /srcs/index.html			/www/
RUN         mkdir -p /run/nginx

RUN         openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -days 3650 -subj "/C=FR/L=JIM/O=42"

COPY        /srcs/start.sh       		/

EXPOSE      80 443

ENTRYPOINT  sh start.sh
