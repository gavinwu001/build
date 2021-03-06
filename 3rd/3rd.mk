include $(ROOTDIR)/build/config/env.mk

MODULE_PATH = $(ROOTDIR)/3rd/$(MODULE)
MODULE_SRC_INC_PATH = $(MODULE_PATH)/include
MODULE_SRC_PATH = $(MODULE_PATH)/src
MODULE_SRC_TEST_PATH = $(MODULE_PATH)/test

MODULE_OUTPUT_PATH = $(OUTPUTS_DIR)/$(MODULE)/$(MODULE_VERSION)

MODULE_OUTPUT_TMP_PATH = $(MODULE_OUTPUT_PATH)/.intermediate
MODULE_OUTPUT_INC_PATH = $(MODULE_OUTPUT_PATH)/include/${MODULE}
MODULE_OUTPUT_LIB_PATH = $(MODULE_OUTPUT_PATH)/lib
MODULE_OUTPUT_BIN_PATH = $(MODULE_OUTPUT_PATH)/bin
MODULE_OUTPUT_CFG_PATH = $(MODULE_OUTPUT_PATH)/etc
MODULE_OUTPUT_TMP_TEST_PATH = $(MODULE_OUTPUT_TMP_PATH)/test
MODULE_OUTPUT_TEST_PATH = $(MODULE_OUTPUT_PATH)/test

MODULE_OBJS = $(patsubst %.c, %.o, $(MODULE_SRC))
MODULE_OUTPUT_OBJS = $(MODULE_OBJS:%=$(MODULE_OUTPUT_TMP_PATH)/%)
MODULE_OUTPUT_TEST_OBJS = $(MODULE_OBJS:%=$(MODULE_OUTPUT_TMP_TEST_PATH)/%)

include $(ROOTDIR)/build/compilation/compilation.mk

prepare_3rd:
	$(MKDIR) $(MODULE_OUTPUT_TMP_PATH)
	$(MKDIR) $(MODULE_OUTPUT_INC_PATH)
	$(MKDIR) $(MODULE_OUTPUT_LIB_PATH)
	$(MKDIR) $(MODULE_OUTPUT_BIN_PATH)
	$(MKDIR) $(MODULE_OUTPUT_CFG_PATH)
	$(MKDIR) $(MODULE_OUTPUT_TMP_TEST_PATH)
	$(MKDIR) $(MODULE_OUTPUT_TEST_PATH)

3rd_build: prepare_3rd build_3rd install_3rd

3rd_clean:
	rm -rf $(MODULE_OUTPUT_PATH)

build_module_test: $(MODULE_TMP_TARGET_TEST)

install_module_test:
	$(CP) ${MODULE_TMP_TARGET_TEST} ${MODULE_TARGET_TEST}

module_testclean:
	rm -rf $(MODULE_OUTPUT_TMP_TEST_PATH)/*
	rm -rf $(MODULE_OUTPUT_TEST_PATH)/*

module_test:module_testclean build_module_test install_module_test
