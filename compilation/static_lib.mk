ifeq (${MODULE_CLASS}, static_lib)

MODULE_TMP_TARGET = ${MODULE_OUTPUT_TMP_PATH}/${MODULE}.a

${MODULE_TMP_TARGET}:${MODULE_OUTPUT_OBJS}
	$(AR) rcs $@ $^

MODULE_TARGET = ${MODULE_OUTPUT_LIB_PATH}/${MODULE}.a

endif
