################################################################################
#
# wifibroadcast
#
################################################################################
WIFIBROADCAST_VERSION = default
WIFIBROADCAST_SOURCE = wifibroadcast-$(WIFIBROADCAST_VERSION).tar.gz
WIFIBROADCAST_SITE = https://bitbucket.org/befi/wifibroadcast
WIFIBROADCAST_SITE_METHOD = hg
WIFIBROADCAST_INSTALL_STAGING = YES

WIFIBROADCAST_DEPENDENCIES = libpcap

define WIFIBROADCAST_BUILD_CMDS
     $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) rx tx rx_status_test
endef

define WIFIBROADCAST_INSTALL_TARGET_CMDS
     mkdir -p $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/rx $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/tx $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/rx_status_test $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/patches/ $(TARGET_DIR)/root/wifibroadcast/
endef

$(eval $(generic-package))
