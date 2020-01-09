#!/bin/bash

docker network rm elastic-network

docker network create \
  --subnet=172.18.0.0/16 \
  --gateway=172.18.0.1 \
  -o "com.docker.network.driver.mtu"="1500" \
  -o "com.docker.network.bridge.enable_icc"="true" \
  -o "com.docker.network.bridge.enable_ip_masquerade"="true" \
  -o "com.docker.network.bridge.host_binding_ipv4"="0.0.0.0" \
  elastic-network
  #-o "com.docker.network.bridge.default_bridge"="true" \
