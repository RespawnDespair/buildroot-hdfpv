################################################################################
#
# wifibroadcastosd
#
################################################################################
WIFIBROADCASTOSD_VERSION = origin/master
WIFIBROADCASTOSD_SITE = https://github.com/RespawnDespair/wifibroadcast-osd.git
WIFIBROADCASTOSD_SITE_METHOD = git
WIFIBROADCASTOSD_INSTALL_STAGING = YES

WIFIBROADCASTOSD_DEPENDENCIES = libpcap

define WIFIBROADCASTOSD_BUILD_CMDS
     $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
endef

define WIFIBROADCASTOSD_INSTALL_TARGET_CMDS
     mkdir -p $(TARGET_DIR)/root/wifibroadcast-osd/
     cp -r $(@D)/osd $(TARGET_DIR)/root/wifibroadcast-osd/
endef

$(eval $(generic-package))
