################################################################################
#
# mackerel-plugin-prometheus-exporter
#
################################################################################

MACKEREL_PLUGIN_PROMETHEUS_EXPORTER_VERSION = 0.3.1
MACKEREL_PLUGIN_PROMETHEUS_EXPORTER_SITE = $(call github,k1LoW,mackerel-plugin-prometheus-exporter,v$(MACKEREL_PLUGIN_PROMETHEUS_EXPORTER_VERSION))
MACKEREL_PLUGIN_PROMETHEUS_EXPORTER_LICENSE = MIT
MACKEREL_PLUGIN_PROMETHEUS_EXPORTER_LICENSE_FILES = LICENSE

$(eval $(golang-package))
