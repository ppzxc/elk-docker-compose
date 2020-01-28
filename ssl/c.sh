#!/bin/bash

# Root CA
openssl genrsa -out root-ca-key.pem 2048
openssl req -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem -config rootca.conf

# Admin cert
openssl genrsa -out admin-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out admin-key.pem
openssl req -new -key admin-key.pem -out admin.csr -config rootca.conf
openssl x509 -days 3650 -req -in admin.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out admin.pem -extfile rootca.conf

# Node cert
openssl genrsa -out redis-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in redis-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out redis-key.pem
openssl req -new -key redis-key.pem -out redis.csr -config redis.conf
openssl x509 -days 3650 -req -in redis.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out redis.pem -extfile redis.con

# Cleanup
#rm admin-key-temp.pem
#rm admin.csr
#rm redis-key-temp.pem
#rm redis.csr
