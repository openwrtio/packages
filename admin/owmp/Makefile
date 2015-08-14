#
# Copyright (C) 2015 OpenWrt.io
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=owmp
PKG_VERSION:=0.4.0
PKG_RELEASE=1

PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=sinkcup <sinkcup@163.com>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.openwrt.io/sources/ \
    https://github.com/openwrtio/owmp/releases/download/$(PKG_VERSION)/
PKG_MD5SUM:=88317da23e065b283f95290324ba8aee

PKG_FIXUP:=autoreconf
PKG_INSTALL:=0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Remote Control
  CATEGORY:=Administration
  DEPENDS:=+curl +!BUSYBOX_CONFIG_SED:sed
  TITLE:=Openwrt WAN Management Protocol
  URL:=http://openwrt.io
endef

define Package/$(PKG_NAME)/description
	After install OWMP in device, it will often request server, We can contrl it from reomote.
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/owmp
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/owmp.sh $(1)/usr/bin/owmp
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/owmp.uci $(1)/etc/config/owmp
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
touch /etc/crontabs/root
r=`grep '/usr/bin/owmp' /etc/crontabs/root`
if [ x"$r" = "x" ]; then
    echo '* * * * * /usr/bin/owmp' >> /etc/crontabs/root
fi
exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
sed -i '/\/usr\/bin\/owmp/d' /etc/crontabs/root
exit 0
endef

$(eval $(call BuildPackage,owmp))
