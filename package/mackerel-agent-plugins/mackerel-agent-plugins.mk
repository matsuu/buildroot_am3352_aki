################################################################################
#
# mackerel-agent-plugins
#
################################################################################

MACKEREL_AGENT_PLUGINS_VERSION = 0.78.1
MACKEREL_AGENT_PLUGINS_SITE = $(call github,mackerelio,mackerel-agent-plugins,v$(MACKEREL_AGENT_PLUGINS_VERSION))
MACKEREL_AGENT_PLUGINS_LICENSE = Apache-2.0
MACKEREL_AGENT_PLUGINS_LICENSE_FILES = LICENSE

MACKEREL_AGENT_PLUGINS_BUILD_TARGETS = mackerel-plugin-conntrack mackerel-plugin-gostats mackerel-plugin-inode mackerel-plugin-linux mackerel-plugin-uptime
MACKEREL_AGENT_PLUGINS_INSTALL_BINS = mackerel-plugin-conntrack mackerel-plugin-gostats mackerel-plugin-inode mackerel-plugin-linux mackerel-plugin-uptime

$(eval $(golang-package))
