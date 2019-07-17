
${MODULE_OUTPUT_TMP_PATH}/%.o: ${MODULE_SRC_PATH}/%.c
	$(GCC) -c $^ -o $@
