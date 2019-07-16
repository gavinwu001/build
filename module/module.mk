include $(rootdir)/build/config/env.mk

MODULE_PATH = $(rootdir)/modules/$(MODULE)
MODULE_SRC_PATH = $(rootdir)/modules/$(MODULE)/src
MODULE_OUTPUT_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)

MODULE_TMP_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)/.tmp
MODULE_INC_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)/inc
MODULE_LIB_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)/lib
MODULE_BIN_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)/bin
MODULE_CFG_PATH = $(outputs-dir)/$(MODULE)/$(MODULE_VERSION)/etc

MODULE_OBJS = $(patsubst %.c, %.o, $(MODULE_SRC))
MODULE_OUTPUT_OBJS = $(MODULE_OBJS:%=$(MODULE_TMP_PATH)/%)

include $(rootdir)/build/compilation/compilation.mk

prepare_module:
	$(MKDIR) $(MODULE_TMP_PATH)
	$(MKDIR) $(MODULE_INC_PATH)
	$(MKDIR) $(MODULE_LIB_PATH)
	$(MKDIR) $(MODULE_BIN_PATH)
	$(MKDIR) $(MODULE_CFG_PATH)

build_module: $(MODULE_TARGET)
	@echo $(MODULE_SRC)
	@echo $(MODULE_OUTPUT_OBJS)

clean_module:
	rm -rf $(MODULE_OUTPUT_PATH)

module_build: prepare_module build_module

module_clean: clean_module
