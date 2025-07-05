#!/usr/bin/env sh

/opt/keycloak/bin/kc.sh start-dev \
  --http-port=8080 \
  --hostname-strict=false
