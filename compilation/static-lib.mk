ifeq (${MODULE_CLASS}, static_lib)

MODULE_TARGET = $(MODULE_LIB_PATH)/${MODULE}.a

%.a: ${MODULE_OUTPUT_OBJS}
	echo ${MODULE_OUTPUT_OBJS}
	echo $(AR)
	echo $@
	echo $^
	$(AR) rcs $@ $^

endif
