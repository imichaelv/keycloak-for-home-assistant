ARG BUILD_FROM
ENV KEYCLOAK_VERSION=26.2.5

FROM quay.io/keycloak/keycloak:26.2.5 AS keycloak
FROM $BUILD_FROM as HA_BASE

RUN apk add --no-cache openjdk17 curl unzip

RUN curl -L https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.zip -o /keycloak.zip \
    && unzip /keycloak.zip -d /opt \
    && mv /opt/keycloak-${KEYCLOAK_VERSION} /opt/keycloak \
    && rm /keycloak.zip

COPY run.sh /run.sh
RUN chmod a+x /run.sh



CMD ["/run.sh"]
