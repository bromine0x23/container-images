# Debian Container Image

基于[官方 Debian 镜像](https://hub.docker.com/_/debian)：

## 定制内容
* 配置语言环境为 `zh_CN.UTF-8`
* 配置时区为 `Asia/Shanghai`
* 安装部分软件包中文翻译（slim 变种未安装）
* 安装实用工具（slim 变种未安装）
    + bash-completion
    + bzip2
    + curl
    + dnsutils
    + gettext
    + htop
    + iputils-ping
    + less
    + nano
    + net-tools
    + openssh-clients
    + sudo
    + telnet
    + tzdata 
    + unzip
    + vim
    + wget
    + xz-utils
    + zlib

## 标签
* [`12`, `latest`](12/Dockerfile): Debian 12 (bookworm)
* [`12-slim`, `slim`](12-slim/Dockerfile): Debian 12 (bookworm) 精简版
* [`11`](11/Dockerfile): Debian 11 (bullseye)
* [`11-slim`](11-slim/Dockerfile): Debian 11 (bullseye) 精简版
