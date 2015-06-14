FROM ubuntu:14.04
MAINTAINER sinkcup <sinkcup@163.com>

RUN \
  ping -c 2 daocloud.openwrt.io && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y subversion git build-essential libncurses5-dev zlib1g-dev gawk unzip gettext libssl-dev intltool openjdk-6-jre-headless optipng xsltproc ccache python wget curl && \
  mkdir -p ~/Downloads/ && \
  wget -O ~/Downloads/hc5761-20140619.tar.gz --user='yangzhou' --password='YZPassword01!' ftp://daocloud.openwrt.io/hc5761-20140619.tar.gz && \
  mkdir -p ~/openwrt/ && \
  tar -zxvf ~/Downloads/hc5761-20140619.tar.gz -C ~/openwrt/ && \
  mkdir -p ~/openwrt/hc5761/package/feeds

WORKDIR ~/openwrt/hc5761/package/feeds
