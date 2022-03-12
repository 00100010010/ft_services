FROM        		alpine:3.13.2

RUN					echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN					apk add nginx telegraf wget php7 php7-fpm php7-mysqli \
					php7-mbstring php7-json php7-session 1>/dev/null
RUN					wget https://wordpress.org/wordpress-5.6.tar.gz && \
					tar xzvf wordpress-5.6.tar.gz && rm wordpress-5.6.tar.gz && \
					mv wordpress /var/www/wordpress

RUN					mkdir /etc/telegraf
COPY				srcs/telegraf.conf		/etc/telegraf/telegraf.conf

RUN					adduser -D -g 'www' www
RUN					mkdir -p /var/www
RUN					chown -R www:www		/var/lib/nginx /var/www
RUN					mkdir -p /run/nginx
COPY				srcs/nginx.conf			/etc/nginx/nginx.conf
COPY				srcs/wp-config.php		/var/www/wordpress

COPY				srcs/start.sh			/

EXPOSE				5050

ENTRYPOINT			sh start.sh
