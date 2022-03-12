FROM	     	alpine:3.12.1

RUN		     	echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		     	apk add vsftpd openssl telegraf

RUN		     	mkdir /etc/telegraf
COPY	     	srcs/telegraf.conf /etc/telegraf/telegraf.conf

RUN		     	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=jtrebes'
RUN		     	adduser -D -h /ftps_folder admin && echo "admin:admin" | chpasswd

COPY 		    /srcs/vsftpd.conf		/etc/vsftpd/
COPY	     	/srcs/start.sh			/

EXPOSE	   		21 28000 28001

ENTRYPOINT		sh start.sh
