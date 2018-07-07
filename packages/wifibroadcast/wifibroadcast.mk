################################################################################
#
# wifibroadcast
#
################################################################################
WIFIBROADCAST_VERSION = origin/master
#WIFIBROADCAST_SOURCE = wifibroadcast-$(WIFIBROADCAST_VERSION).tar.gz
WIFIBROADCAST_SITE = https://github.com/RespawnDespair/wifibroadcast-base.git
WIFIBROADCAST_SITE_METHOD = git
WIFIBROADCAST_INSTALL_STAGING = YES

WIFIBROADCAST_DEPENDENCIES = libpcap wiringpi

define WIFIBROADCAST_BUILD_CMDS
     $(MAKE) clean	
     $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
endef

define WIFIBROADCAST_INSTALL_TARGET_CMDS
     mkdir -p $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/rx $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/tx_rawsock $(TARGET_DIR)/root/wifibroadcast/
     cp -r $(@D)/rx_status $(TARGET_DIR)/root/wifibroadcast/
endef

$(eval $(generic-package))
