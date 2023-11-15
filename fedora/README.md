# Fedora Container Image
[![Fedora 镜像](https://github.com/bromine0x23/container-images/actions/workflows/fedora.yml/badge.svg)](https://github.com/bromine0x23/container-images/actions/workflows/fedora.yml)

基于[官方 Fedora 镜像](https://hub.docker.com/_/fedora)：

## 定制内容
* 配置语言环境为 `zh_CN.UTF-8`
* 配置时区为 `Asia/Shanghai`
* 安装部分软件包中文翻译（slim 变种未安装）
* 安装实用工具（slim 变种未安装）
    + bash-completion
    + bind-utils
    + binutils
    + bzip2
    + curl
    + dnf-plugins-core
    + gettext
    + htop
    + iputils
    + less
    + nano
    + net-tools
    + openssh-clients
    + procps-ng 
    + sudo
    + telnet
    + traceroute
    + tzdata 
    + unzip
    + vim
    + wget
    + xz
    + zlib

## 标签
* [`39`, `latest`](39/Dockerfile): Fedora 39
* [`39-slim`, `slim`](39/Dockerfile): Fedora 39 精简版
* [`38`](38/Dockerfile): Fedora 38
* [`38-slim`](38/Dockerfile): Fedora 38 精简版