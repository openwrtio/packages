#
# Copyright (C) 2006,2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=wifidog
PKG_VERSION:=1.2.1
PKG_RELEASE=2

PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=sinkcup <sinkcup@163.com>

PKG_SOURCE:=$(PKG_NAME)-gateway-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.openwrt.io/dl/ \
    https://github.com/wifidog/wifidog-gateway/releases/download/$(PKG_VERSION)/
PKG_MD5SUM:=3c9c35968f154b1c9224245a5d708d5f
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-gateway-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_INSTALL:=0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables-mod-extra +iptables-mod-ipopt +kmod-ipt-nat +iptables-mod-nat-extra +libpthread
  TITLE:=A wireless captive portal solution
  URL:=http://www.wifidog.org
endef

define Package/$(PKG_NAME)/description
	The Wifidog project is a complete and embeddable captive
	portal solution for wireless community groups or individuals
	who wish to open a free Hotspot while still preventing abuse
	of their Internet connection.
endef

define Package/$(PKG_NAME)/conffiles
/etc/wifidog.conf
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scripts/init.d/wifidog $(1)/usr/bin/wifidog-init
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/wifidog $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/wdctl $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libhttpd.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/wifidog.conf $(1)/etc/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/wifidog-msg.html $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/wifidog.init $(1)/etc/init.d/wifidog
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
