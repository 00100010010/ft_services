FROM				alpine:3.13.2

RUN					mkdir -p /run/nginx
RUN					echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN					apk add nginx telegraf wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN					wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
					tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
					rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
					mkdir -p /www && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

RUN					mkdir /etc/telegraf
COPY				srcs/telegraf.conf				/etc/telegraf/telegraf.conf

RUN					adduser -D -g 'www' www
RUN					chown -R www:www				/var/lib/nginx /www
COPY				/srcs/nginx.conf 				/etc/nginx/nginx.conf
COPY				/srcs/config.inc.php			/www/phpmyadmin/

COPY				/srcs/start.sh					/

EXPOSE				5000

ENTRYPOINT			sh	start.sh
