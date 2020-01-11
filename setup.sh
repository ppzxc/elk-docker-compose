#!/bin/bash

NETWORK_NAME=elastic-network

if [ "$1" = "up" ] 
then
        docker-compose build
	docker-compose up -d
	docker-compose logs -f
elif [ "$1" = "network" ] 
then
	if [ "$2" = "create" ]
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
elif [ "$1" = "down" ] 
then
	docker-compose down -v
elif [ "$1" = "reload" ] 
then
	docker-compose build
	docker-compose up -d
	docker-compose logs -f
else
	echo "null or empty"
fi
