################################################################################
#
# smartmeter-exporter
#
################################################################################

SMARTMETER_EXPORTER_VERSION = 0.0.2
SMARTMETER_EXPORTER_SITE = $(call github,matsuu,go-el-controller,rl7023)

SMARTMETER_EXPORTER_BUILD_TARGETS = cmd/smartmeter-exporter

SMARTMETER_EXPORTER_BROUTEID = $(call qstrip,$(BR2_PACKAGE_SMARTMETER_EXPORTER_BROUTEID))
SMARTMETER_EXPORTER_BROUTEPW = $(call qstrip,$(BR2_PACKAGE_SMARTMETER_EXPORTER_BROUTEPW))
SMARTMETER_EXPORTER_EXPORTER_PORT = $(call qstrip,$(BR2_PACKAGE_SMARTMETER_EXPORTER_EXPORTER_PORT))
SMARTMETER_EXPORTER_INTERVAL = $(call qstrip,$(BR2_PACKAGE_SMARTMETER_EXPORTER_INTERVAL))
SMARTMETER_EXPORTER_SERIAL_PORT = $(call qstrip,$(BR2_PACKAGE_SMARTMETER_EXPORTER_SERIAL_PORT))
define SMARTMETER_EXPORTER_INSTALL_CONFIG_FILES
	$(INSTALL) -d $(TARGET_DIR)/etc/default
	echo 'SMARTMETER_EXPORTER_ARGS="-brouteid $(SMARTMETER_EXPORTER_BROUTEID) -broutepw $(SMARTMETER_EXPORTER_BROUTEPW) -exporter-port $(SMARTMETER_EXPORTER_EXPORTER_PORT) -interval $(SMARTMETER_EXPORTER_INTERVAL) -serial-port $(SMARTMETER_EXPORTER_SERIAL_PORT)"' > $(TARGET_DIR)/etc/default/smartmeter-exporter
endef
SMARTMETER_EXPORTER_POST_INSTALL_TARGET_HOOKS = SMARTMETER_EXPORTER_INSTALL_CONFIG_FILES

ifeq ($(BR2_USE_MMU),y)
define SMARTMETER_EXPORTER_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/smartmeter-exporter/S50smartmeter-exporter \
		$(TARGET_DIR)/etc/init.d/S50smartmeter-exporter
endef
endif

$(eval $(golang-package))
