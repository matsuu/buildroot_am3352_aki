################################################################################
#
# mackerel-agent
#
################################################################################

MACKEREL_AGENT_VERSION = 0.75.2
MACKEREL_AGENT_SITE = $(call github,mackerelio,mackerel-agent,v$(MACKEREL_AGENT_VERSION))
MACKEREL_AGENT_LICENSE = Apache-2.0
MACKEREL_AGENT_LICENSE_FILES = LICENSE

MACKEREL_AGENT_LDFLAGS = \
	-X github.com/mackerelio/mackerel-agent/version.GITCOMMIT=220aab7 \
	-X github.com/mackerelio/mackerel-agent/version.VERSION=$(MACKEREL_AGENT_VERSION)

MACKEREL_AGENT_APIKEY = $(call qstrip,$(BR2_PACKAGE_MACKEREL_AGENT_APIKEY))
define MACKEREL_AGENT_INSTALL_CONFIG_FILES
	$(INSTALL) -D -m 644 package/mackerel-agent/mackerel-agent.conf \
		$(TARGET_DIR)/etc/mackerel-agent/mackerel-agent.conf
	$(SED) 's@^# apikey = ""@apikey = "$(MACKEREL_AGENT_APIKEY)"@' $(TARGET_DIR)/etc/mackerel-agent/mackerel-agent.conf
endef
MACKEREL_AGENT_POST_INSTALL_TARGET_HOOKS = MACKEREL_AGENT_INSTALL_CONFIG_FILES

ifeq ($(BR2_USE_MMU),y)
define MACKEREL_AGENT_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/mackerel-agent/S50mackerel-agent \
		$(TARGET_DIR)/etc/init.d/S50mackerel-agent
endef
endif

$(eval $(golang-package))
