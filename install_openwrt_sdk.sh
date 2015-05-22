#!/bin/bash
set -ev

mkdir -p ~/Downloads/
if [ ! -f ~/Downloads/hc5761-20140619.tar.gz ]; then
    wget -O ~/Downloads/hc5761-20140619.tar.gz --user='yangzhou' --password='YZPassword01!' ftp://52.68.198.48/hc5761-20140619.tar.gz
fi
md5sum ~/Downloads/hc5761-20140619.tar.gz
md5=`md5sum ~/Downloads/hc5761-20140619.tar.gz`
echo $md5
if [ $md5 != "3bf4536657de61551d11f80fa8e804f4" ]; then
    rm ~/Downloads/hc5761-20140619.tar.gz
    return 1
fi

mkdir -p ~/openwrt/
rm -rf ~/openwrt/hc5761
tar -zxvf ~/Downloads/hc5761-20140619.tar.gz -C ~/openwrt/
