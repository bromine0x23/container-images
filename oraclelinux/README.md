# OracleLinux Container Image
[![Oracle 镜像](https://github.com/bromine0x23/container-images/actions/workflows/oraclelinux.yml/badge.svg)](https://github.com/bromine0x23/container-images/actions/workflows/oraclelinux.yml)

基于[官方 OracleLinux 镜像](https://hub.docker.com/_/oraclelinux)：

## 定制内容
* 配置语言环境为 `zh_CN.UTF-8`
* 配置时区为 `Asia/Shanghai`
* 安装部分软件包中文翻译（slim 变种未安装）
* 安装实用工具（slim 变种未安装）
    + bash-completion
    + bind-utils
    + binutils
    + bzip2
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
* [9, latest](9/Dockerfile): OracleLinux 9
* [9-slim, slim](9/Dockerfile): OracleLinux 9 精简版
* [8](8/Dockerfile): OracleLinux 8
* [8-slim](8/Dockerfile): OracleLinux 8 精简版
* [7](7/Dockerfile): OracleLinux 7
* [7-slim](7/Dockerfile): OracleLinux 7 精简版