ARG BASE_IMAGE=bromine0x23/fedora

# hadolint ignore=DL3006
FROM $BASE_IMAGE

ARG JAVA_HOME_DIR
ARG JAVA_PACKAGE
ARG JAVA_CACERTS=/lib/security/cacerts

ENV JAVA_HOME="/usr/lib/jvm/${JAVA_HOME_DIR}"
ENV PATH="$JAVA_HOME/bin:$PATH"

# hadolint ignore=DL3041
RUN set -o errexit -o nounset -o xtrace; \
    { \
        echo '[Adoptium]'; \
        echo 'name=Adoptium'; \
        echo "baseurl=https://packages.adoptium.net/artifactory/rpm/$(. /etc/os-release; echo $ID)/\$releasever/\$basearch"; \
        echo 'enabled=1'; \
        echo 'gpgcheck=1'; \
        echo "gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public"; \
    } > /etc/yum.repos.d/adoptium.repo; \
    dnf -y install --nodocs --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
        ${JAVA_PACKAGE} \
    ; \
    dnf -y clean all; \
    rm -rf /var/cache/dnf; \
    rm -rf /var/cache/yum; \
    rm -rf /var/log/*.log; \
# 覆盖 CA 证书
    ln -sf /etc/ssl/certs/java/cacerts "${JAVA_HOME}${JAVA_CACERTS}"; \
# basic smoke test
    java -version
