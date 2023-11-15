ARG BASE_IMAGE=oraclelinux:7

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
 && yum repolist \
# 设置时区
 && ln -sf /usr/share/zoneinfo/${LOCALE_TIMEZONE} /etc/localtime \
# 设置语言环境
 && echo "override_install_langs=en_US.utf8:${LOCALE_LANGUAGE}_${LOCALE_COUNTRY}" >> /etc/yum.conf \
 && yum -y reinstall \
        glibc-common \
# 安装翻译
 && if [ "${IS_SLIM}" == '' ]; then \
       yum -y reinstall \
           bash \
           coreutils \
           findutils \
           grep \
           sed \
           shadow-utils \
           yum \
       ; \
    fi \
# 检查可升级软件包
 && (yum check-update || true) \
# 升级重要的或者有安全漏洞的软件包
 && yum -y update \
        ca-certificates \
        yum \
        openssl-libs \
        python-libs \
 && yum -y install --setopt=tsflags=nodocs \
        oracle-epel-release \
# 安装常用工具
 && if [ "${IS_SLIM}" == '' ]; then \
       yum -y install --setopt=tsflags=nodocs \
           bash \
           bash-completion \
           bind-utils \
           binutils \
           bzip2 \
           curl \
           gettext \
           gzip \
           htop \
           iputils \
           less \
           nano \
           net-tools \
           procps-ng \
           sudo \
           tar \
           telnet \
           traceroute \
           unzip \
           vim \
           wget \
           xz \
           zlib \
       ; \
    fi \
 && yum -y clean all \
 && rm -rf /var/cache/yum