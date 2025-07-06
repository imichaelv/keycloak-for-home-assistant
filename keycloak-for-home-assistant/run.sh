#!/usr/bin/with-contenv bashio

export KC_BOOTSTRAP_ADMIN_USERNAME=$(bashio::config 'KC_BOOTSTRAP_ADMIN_USERNAME')
export KC_BOOTSTRAP_ADMIN_PASSWORD=$(bashio::config 'KC_BOOTSTRAP_ADMIN_PASSWORD')

/opt/keycloak/bin/kc.sh start-dev \
  --http-port=8080 \
  --hostname-strict=false \
  --http-enabled=true
