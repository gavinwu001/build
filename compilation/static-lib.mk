ifeq (${MODULE_CLASS}, static_lib)

MODULE_TARGET = $(MODULE_LIB_PATH)/${MODULE}.a

%.a: ${MODULE_OUTPUT_OBJS}
	$(AR) rcs $@ $^

endif
