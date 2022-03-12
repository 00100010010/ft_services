#!/bin/bash

O="\e[0m"
R="\e[31m"
G="\e[32m"

cleaning()
{
	printf "${G}[ CLEANING ]${O}"
	rm -rf last.log
	printf "user42\nuser42" | sudo -S service nginx stop 1> last.log 2>&1
	minikube delete 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S usermod -aG docker $(whoami); 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S chmod 666 /var/run/docker.sock 1> last.log 2>&1
}

install_kubectl()
{
	printf "\n${G}[ INSTALLING KUBECTL ]${O}"
	printf "user42\nuser42" | sudo -S curl -LO --silent https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S chmod +x ./kubectl 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S mv ./kubectl /usr/local/bin/kubectl 1> last.log 2>&1
}

install_minikube()
{
	printf "\n${G}[ INSTALLING MINIKUBE ]${O}"
	printf "user42\nuser42" | sudo -S curl -LO --silent https://storage.googleapis.com/minikube/releases/v1.17.0/minikube-linux-amd64 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S chmod +x minikube-linux-amd64 1> last.log 2>&1
	printf "user42\nuser42" | sudo -S install minikube-linux-amd64 /usr/local/bin/minikube 1> last.log 2>&1
}

start_minikube()
{
	printf "\n${G}[ STARTING MINIKUBE ]${O}"
	minikube start --vm-driver=docker 1> last.log 2>&1
}

command_eval()
{
	printf "\n${G}[ EVAL COMMAND ]${O}"
	eval $(minikube docker-env) 1> last.log 2>&1
}

install_metallb()
{
	printf "\n${G}[ INSTALLING METALLB ]${O}"
	MINIKUBE_IP="$(minikube ip)"
	sed -e "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/templates/metallb.yaml > srcs/metallb.yaml
	sed -e "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/templates/nginx.conf > srcs/nginx/srcs/nginx.conf
	sed -e "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/templates/wordpress.sql > srcs/mysql/srcs/wordpress.sql
	sed -e "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/templates/vsftpd.conf > srcs/ftps/srcs/vsftpd.conf
	minikube addons enable metallb 1> last.log 2>&1
	kubectl apply -f ./srcs/metallb.yaml 1> last.log 2>&1
}

docker_build_create()
{
	if docker build -t "$1" "./srcs/$1" 1> last.log 2>&1;
	then
		printf "\n${G}      [dock]   %s${O}" "$1"
		if kubectl apply -f "./srcs/$1/$1.yaml" 1> last.log 2>&1;
		then
			printf "\n${G}      [yaml]   %s${O}" "$1"
			return 0
		fi
		printf "\n${R}      [yaml]   %s${O}" "$1"
		exit 1
	fi
	printf "\n${R}      [dock]   %s${O}" "$1"
	exit 1
}

build_create_deployments()
{
	printf "\n${G}[ BUILDING DOCKER IMAGES AND APPLYING DEPLOYMENTS & SERVICES]${O}"
	docker_build_create nginx
	docker_build_create phpmyadmin
	docker_build_create wordpress
	docker_build_create mysql
	docker_build_create ftps
	docker_build_create grafana
	docker_build_create influxdb
}

display_infos()
{
	printf "\n${G}[ FINISHING ]${O}"
	IP=$(minikube ip)
	sleep 8
	#minikube status
	#kubectl get all -o wide 1> last.log 2>&1
	#kubectl cluster-info
	kubectl get deployments
	kubectl get pods
	kubectl get services
	kubectl get pvc
	#minikube dashboard
}

ft_pkill()
{
	if [ ! "$1" ] || ([ "$1" != "all" ] && [ "$1" != "telegraf" ]); then
		printf "Error : put 2nd arg [all] or [telegraf]\n"
		printf "./setup.sh pkill + [all] or [telegraf]"
	else
		if [ "$1" == "all" ]; then
			set -x
			kubectl exec deploy/nginx -- pkill nginx
			kubectl exec deploy/phpmyadmin -- pkill nginx
			kubectl exec deploy/mysql -- pkill mysqld
			kubectl exec deploy/wordpress -- pkill nginx
			kubectl exec deploy/grafana -- pkill grafana
			kubectl exec deploy/influxdb -- pkill influxd
			kubectl exec deploy/ftps -- pkill vsftpd
		elif [ "$1" == "telegraf" ]; then
			set -x
			kubectl exec deploy/nginx -- pkill telegraf
			kubectl exec deploy/phpmyadmin -- pkill telegraf
			kubectl exec deploy/mysql -- pkill telegraf
			kubectl exec deploy/wordpress -- pkill telegraf
			kubectl exec deploy/grafana -- pkill telegraf
			kubectl exec deploy/influxdb -- pkill telegraf
			kubectl exec deploy/ftps -- pkill telegraf
		fi
	fi
}

main()
{
	if [ ! "$1" ]; then
		clear
		cleaning
		install_kubectl
		install_minikube
		start_minikube
		command_eval
		install_metallb
		build_create_deployments
		display_infos
	elif [ "$1" == "pkill" ];then
		ft_pkill $2
	else
		printf "./setup.sh pkill + [all] or [telegraf]"
	fi
}

main "$1" "$2"
