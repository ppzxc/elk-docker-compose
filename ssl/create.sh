#!/bin/bash

echo "$1"

openssl genrsa -out $1-pkcs12.key 2048
openssl pkcs8 -v1 "PBE-SHA1-3DES" -in "$1-pkcs12.key" -topk8 -out "$1-key.pem" -nocrypt
openssl req -new -key $1-key.pem -out $1.csr
openssl x509 -req -in $1.csr -CA rootca.pem -CAkey rootca-key.pem -CAcreateserial -out $1.pem -sha256
