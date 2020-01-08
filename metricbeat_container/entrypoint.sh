#!/usr/bin/env bash

while ! curl -s -X GET http://172.18.0.1:9200/_cluster/health\?wait_for_status\=yellow\&timeout\=60s | grep -q '"status":"yellow"'
do
    echo "==> Waiting for cluster YELLOW status = http://localhost:9200" && sleep 1
done

echo ""
echo "Cluster is YELLOW. Fine ! (But you could maybe try to have it GREEN ;))"
echo ""

while ! curl -s -I http://172.18.0.1:5601/api/status | grep "200 OK" > /dev/null
do
    echo "==> Waiting for kibana status" && sleep 1
done

sleep 5s

echo ""
echo "kibana status up"
echo ""

bash -c "/usr/local/bin/docker-entrypoint $*"
