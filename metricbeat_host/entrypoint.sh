#!/usr/bin/env bash

while ! curl -s -X GET http://172.18.0.2:9200/_cluster/health\?wait_for_status\=green\&timeout\=60s | grep -q '"status":"green"'
do
    echo "==> Waiting for cluster green status" && sleep 1
done

while ! curl -s -X GET http://172.18.0.3:9200/_cluster/health\?wait_for_status\=green\&timeout\=60s | grep -q '"status":"green"'
do
    echo "==> Waiting for cluster green status" && sleep 1
done

while ! curl -s -X GET http://172.18.0.4:9200/_cluster/health\?wait_for_status\=green\&timeout\=60s | grep -q '"status":"green"'
do
    echo "==> Waiting for cluster green status" && sleep 1
done

echo ""
echo "Cluster is green. Fine ! (But you could maybe try to have it GREEN ;))"
echo ""

while ! curl -s -I http://172.18.0.9:5601/api/status | grep "200 OK" > /dev/null
do
    echo "==> Waiting for kibana status" && sleep 1
done

echo ""
echo "kibana status up"
echo ""

bash -c "/usr/local/bin/docker-entrypoint $*"
