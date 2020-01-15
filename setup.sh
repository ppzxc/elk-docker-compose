#!/bin/bash

NETWORK_NAME=elastic-network

if [ "$1" = "up" -o "$1" = "u" ] 
then
        docker-compose build
	docker-compose up -d
	docker-compose logs -f
elif [ "$1" = "network" -o "$1" = "n" ] 
then
	if [ "$2" = "create" -o "$2" = "c" ]
	then
		docker network rm $NETWORK_NAME
        	docker network create \
	  	  --subnet=172.18.0.0/16 \
	  	  --gateway=172.18.0.1 \
	  	  -o "com.docker.network.driver.mtu"="1500" \
	  	  -o "com.docker.network.bridge.enable_icc"="true" \
	  	  -o "com.docker.network.bridge.enable_ip_masquerade"="true" \
	  	  -o "com.docker.network.bridge.host_binding_ipv4"="0.0.0.0" \
	  	  $NETWORK_NAME
	fi
elif [ "$1" = "down" -o "$1" = "d" ] 
then
	docker-compose down -v
elif [ "$1" = "reload" -o "$1" = "r" ] 
then
	docker-compose build
	docker-compose up -d
	#docker-compose logs -f
else
	echo "null or empty"
fi
