#!/usr/bin/env bash

curl -X GET "${CDURL}" -h "content-type: application/json" -d '{ "secret_key": "'"${SECRET_KEY}"'" }'
