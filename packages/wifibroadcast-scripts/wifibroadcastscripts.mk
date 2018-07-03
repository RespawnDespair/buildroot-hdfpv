################################################################################
#
# wifibroadcast start scripts
#
################################################################################
WIFIBROADCASTSCRIPTS_VERSION = default
WIFIBROADCASTSCRIPTS_SOURCE = wifibroadcast_fpv_scripts-$(WIFIBROADCASTSCRIPTS_VERSION).tar.gz
WIFIBROADCASTSCRIPTS_SITE = https://bitbucket.org/befi/wifibroadcast_fpv_scripts
WIFIBROADCASTSCRIPTS_SITE_METHOD = hg
WIFIBROADCASTSCRIPTS_INSTALL_STAGING = YES

define WIFIBROADCASTSCRIPTS_INSTALL_TARGET_CMDS
     mkdir -p $(TARGET_DIR)/root/wifibroadcast_fpv_scripts/init.d/
     cp /home/sambr/buildroot/package/wifimodprobe/S00wifi $(TARGET_DIR)/etc/init.d/
     cp $(@D)/init.d/wbcrxd $(TARGET_DIR)/etc/init.d/
     cp $(@D)/init.d/wbctxd $(TARGET_DIR)/etc/init.d/
     cp $(@D)/rx.sh $(TARGET_DIR)/root/wifibroadcast_fpv_scripts/
     cp $(@D)/tx.sh $(TARGET_DIR)/root/wifibroadcast_fpv_scripts/
     cp $(@D)/settings.sh $(TARGET_DIR)/root/wifibroadcast_fpv_scripts/
endef

$(eval $(generic-package))
