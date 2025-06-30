#!/usr/bin/env bash


/opt/keycloak/bin/kc.sh start-dev \
  --http-port=8080 \
  --hostname-strict=false \
  --hostname-strict-https=false
