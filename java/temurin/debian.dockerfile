ARG BASE_IMAGE=bromine0x23/debian

# hadolint ignore=DL3006
FROM $BASE_IMAGE

ARG TARGETARCH
ARG JAVA_HOME_DIR
ARG JAVA_PACKAGE
ARG JAVA_CACERTS=/lib/security/cacerts

ENV JAVA_HOME="/usr/lib/jvm/${JAVA_HOME_DIR}-${TARGETARCH}"
ENV PATH="$JAVA_HOME/bin:$PATH"

# hadolint ignore=DL3008,DL4006
RUN set -o errexit -o nounset -o xtrace \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc; \
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list; \
    mkdir -p /usr/share/man/man1/; \
    apt-get update; \
    apt-get install -y --no-install-recommends --no-install-suggests\
        ${JAVA_PACKAGE} \
        ca-certificates-java=* \
    ; \
    rm -rf /var/lib/apt/lists/*; \
# 覆盖 CA 证书
    ln -sf /etc/ssl/certs/java/cacerts "${JAVA_HOME}${JAVA_CACERTS}"; \
# basic smoke test
    java -version
