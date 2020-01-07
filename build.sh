#!/bin/bash

docker network create --driver bridge elastic-network

docker-compose up

