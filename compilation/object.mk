
#%.o: $(patsubst $(MODULE_TMP_PATH), $(MODULE_SRC_PATH), %.c)
${MODULE_TMP_PATH}/%.o: ${MODULE_SRC_PATH}/%.c
	$(GCC) -c $^ -o $@
	@echo $@
	@echo 000
	@echo $^
	@echo 111
	@echo ${MODULE_TMP_PATH}
	@echo ${MODULE_SRC_PATH}
	@echo 222
	@echo $(patsubst ${MODULE_TMP_PATH}, ${MODULE_SRC_PATH}, $@)
	@echo $(patsubst ${MODULE_TMP_PATH}, ${MODULE_SRC_PATH}, $@)
	@echo 333
