ARG BASE_IMAGE=fedora:38

# hadolint ignore=DL3006
FROM $BASE_IMAGE

ARG IS_SLIM=

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
# 禁用 fedora-cisco-openh264
 && sed --in-place "s|^enabled=1$|^enabled=0$|"  /etc/yum.repos.d/fedora-cisco-openh264.repo \
# 设置时区
 && ln -sf /usr/share/zoneinfo/${LOCALE_TIMEZONE} /etc/localtime \
# 设置语言环境
 && sed --in-place "s|^\(%_install_langs\s*.*\)$|\1:${LOCALE_LANGUAGE}_${LOCALE_COUNTRY}|" /etc/rpm/macros.image-language-conf \
 && dnf -y install --best --nodocs --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
        glibc-langpack-zh \
 && sed --in-place "s|^LANG\s*=\s*\".*\"$|LANG=\"${LOCALE_LANGUAGE}_${LOCALE_COUNTRY}.${LOCALE_CHARMAP}\"|" /etc/locale.conf \
# 安装翻译
 && if [ "${IS_SLIM}" == '' ]; then \
       dnf -y reinstall --nodocs --setopt='tsflags=nodocs' \
           bash \
           coreutils \
           dnf \
           findutils \
           grep \
           sed \
           shadow-utils \
           tar \
       ; \
    fi \
# 升级重要的或者有安全漏洞的软件包
 && dnf -y upgrade \
        dnf \
        ca-certificates \
        tzdata=* \
# 安装常用工具
 && if [ "${IS_SLIM}" == '' ]; then \
       dnf -y install --best --nodocs --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
           bash-completion \
           bind-utils \
           binutils \
           bzip2 \
           curl \
           dnf-plugins-core \
           gettext \
           htop \
           iputils \
           nano \
           net-tools \
           openssh-clients \
           procps-ng \
           sudo \
           telnet \
           traceroute \
           tzdata \
           unzip \
           vim \
           wget \
           xz \
           zlib \
       ; \
    fi \
 && dnf -y clean all \
 && rm -rf /var/cache/dnf

