ARG BASE_IMAGE=oraclelinux:8

# hadolint ignore=DL3006
FROM $BASE_IMAGE

ARG IS_SLIM=
ARG DNF=dnf

ARG LOCALE_LANGUAGE=zh
ARG LOCALE_COUNTRY=CN
ARG LOCALE_CHARMAP=UTF-8
ARG LOCALE_TIMEZONE=Asia/Shanghai

ENV LANG ${LOCALE_LANGUAGE}_${LOCALE_COUNTRY}.${LOCALE_CHARMAP}
ENV TZ   ${LOCALE_TIMEZONE}

# for DL4006: https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3039,DL3041
RUN set -o errexit -o nounset -o xtrace \
 && ${DNF} repolist \
# 设置时区
 && ln -sf /usr/share/zoneinfo/${LOCALE_TIMEZONE} /etc/localtime \
# 设置语言环境
 && ${DNF} -y install --nodocs --setopt='tsflags=nodocs' \
        dnf \
        langpacks-zh_CN \
        glibc-langpack-zh \
# 检查可升级软件包
 && (dnf check-update || true) \
# 升级重要的或者有安全漏洞的软件包
 && dnf -y update \
        ca-certificates \
        dnf \
        microdnf \
        libgcrypt \
        gnutls \
        python3-libs \
# 安装常用工具
 && if [ "${IS_SLIM}" == '' ]; then \
       dnf -y --best install --nodocs --setopt='tsflags=nodocs' \
           bash \
           bash-completion \
           bind-utils \
           binutils \
           bzip2 \
           curl \
           dnf-plugins-core \
           findutils \
           gettext \
           gzip \
           htop \
           iputils \
           less \
           nano \
           net-tools \
           procps-ng \
           shadow-utils \
           sudo \
           tar \
           telnet \
           traceroute \
           unzip \
           vim \
           wget \
           xz \
           yum \
           zlib \
       ; \
    fi \
 && dnf -y clean all \
 && rm -rf /var/cache/dnf \
 && rm -rf /var/cache/yum
