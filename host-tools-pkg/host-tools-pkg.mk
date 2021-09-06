include $(ROOTDIR)/build/config/env.mk

MODULE_PATH = $(ROOTDIR)/host-tools-pkg/$(MODULE)

MODULE_OUTPUT_PATH = $(HOST_TOOLS_OUTPUTS_DIR)/$(MODULE)/$(MODULE_VERSION)

MODULE_OUTPUT_TMP_PATH = $(MODULE_OUTPUT_PATH)/.intermediate

host_tools_pkg_prepare:
	$(MKDIR) $(MODULE_OUTPUT_TMP_PATH)

host_tools_pkg_clean:
	rm -rf $(MODULE_OUTPUT_PATH)

host_tools_pkg_build: host_tools_pkg_prepare host_tools_pkg_spec_build
