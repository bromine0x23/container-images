ARG BASE_IMAGE=debian:11-slim

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

RUN set -o errexit -o nounset -o xtrace \
 && apt-get update \
# 设置语言环境
 && apt-get install -y --no-install-recommends \
        locales=* \
 && localedef -i ${LOCALE_LANGUAGE}_${LOCALE_COUNTRY} -c -f ${LOCALE_CHARMAP} -A /usr/share/locale/locale.alias ${LOCALE_LANGUAGE}_${LOCALE_COUNTRY}.${LOCALE_CHARMAP} \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
 && echo "${LANG} ${LOCALE_CHARMAP}" >> /etc/locale.gen \
 && locale-gen \
# 设置时区
 && ln -sf /usr/share/zoneinfo/${LOCALE_TIMEZONE} /etc/localtime \
# 安装 GnuPG
 && apt-get install -y --no-install-recommends --no-install-suggests \
        gnupg=* \
# 升级重要的或者有安全漏洞的软件包
 && apt-get upgrade -y  \
        apt=* \
        ca-certificates=* \
        tzdata=* \
# 安装常用工具
 && if [ "${IS_SLIM}" == '' ]; then \
       apt-get install -y --no-install-recommends --no-install-suggests \
           bash-completion=* \
           bzip2=* \
           curl=* \
           dnsutils=* \
           gettext=* \
           htop=* \
           iputils-ping=* \
           less=* \
           nano=* \
           openssh-client=* \
           sudo=* \
           telnet=* \
           unzip=* \
           vim=* \
           wget=* \
           xz-utils=* \
           zip=* \
          ; \
    fi \
# APT清理
 && rm -rf /var/lib/apt/lists/*