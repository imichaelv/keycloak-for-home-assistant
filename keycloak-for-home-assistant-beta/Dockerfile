# renovate: depName=keycloak/keycloak
ARG KEYCLOAK_VERSION=26.2.5
ARG BUILD_FROM
FROM $BUILD_FROM as HA_BASE

ARG KEYCLOAK_VERSION
ENV KEYCLOAK_VERSION=${KEYCLOAK_VERSION}

RUN apk add --no-cache openjdk17 curl unzip

RUN curl -L https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.zip -o /keycloak.zip \
    && unzip /keycloak.zip -d /opt \
    && mv /opt/keycloak-${KEYCLOAK_VERSION} /opt/keycloak \
    && rm /keycloak.zip

COPY run.sh /etc/services.d/keycloak/run
RUN chmod a+x /etc/services.d/keycloak/run
