ifeq (${MODULE_CLASS}, app)

MODULE_DEPS_PATH = ${MODULE_DEPS:%=${OUTPUTS_DIR}/%/lib}
MODULE_DEPS_OUTPUT_LIBS_DIRS = $(foreach DEP, ${MODULE_DEPS}, ${OUTPUTS_DIR}/${DEP}/lib/)
MODULE_DEPS_LIBS = $(foreach DEP, ${MODULE_DEPS}, $(subst lib,,$(firstword $(subst /, ,${DEP}))))
MODULE_LD_FLAGS = ${MODULE_DEPS_LIBS:%=-l%}
MODULE_LD_FLAGS += ${MODULE_DEPS_OUTPUT_LIBS_DIRS:%=-L%}

MODULE_TMP_TARGET = ${MODULE:%=${MODULE_OUTPUT_TMP_PATH}/%}


${MODULE_TMP_TARGET}:${MODULE_OUTPUT_OBJS}
	$(GCC) -o $@ $^ ${MODULE_LD_FLAGS}

MODULE_TARGET = ${MODULE_OUTPUT_BIN_PATH}/${MODULE}

endif

ifeq (${SUBMODULECHILD_CLASS}, app)

SUBMODULECHILD_DEPS_PATH = ${SUBMODULECHILD_DEPS:%=${OUTPUTS_DIR}/%/lib}
SUBMODULECHILD_DEPS_OUTPUT_LIBS_DIRS = $(foreach DEP, ${SUBMODULECHILD_DEPS}, ${OUTPUTS_DIR}/${DEP}/lib/)
SUBMODULECHILD_DEPS_LIBS = $(foreach DEP, ${SUBMODULECHILD_DEPS}, $(subst lib,,$(firstword $(subst /, ,${DEP}))))

SUBMODULECHILD_LD_FLAGS = ${SUBMODULECHILD_DEPS_LIBS:%=-l%}
SUBMODULECHILD_LD_FLAGS += ${SUBMODULECHILD_DEPS_OUTPUT_LIBS_DIRS:%=-L%}
ifneq ($(findstring cpp,${SUBMODULECHILD_SRC}),)
SUBMODULECHILD_LD_FLAGS += -lstdc++
SUBMODULECHILD_LD_FLAGS += -lm
endif

SUBMODULECHILD_TMP_TARGET = ${SUBMODULECHILD:%=${SUBMODULECHILD_OUTPUT_TMP_PATH}/%}


${SUBMODULECHILD_TMP_TARGET}:${SUBMODULECHILD_OUTPUT_OBJS}
	$(GCC) -o $@ $^ ${SUBMODULECHILD_LD_FLAGS}

SUBMODULECHILD_TARGET = ${SUBMODULECHILD_OUTPUT_BIN_PATH}/${SUBMODULECHILD}

endif

ifeq (${MODULE_CLASS}, test_app)

MODULE_DEPS_PATH = ${MODULE_DEPS:%=${OUTPUTS_DIR}/%/lib}
MODULE_DEPS_OUTPUT_LIBS_DIRS = $(foreach DEP, ${MODULE_DEPS}, ${OUTPUTS_DIR}/${DEP}/lib/)
MODULE_DEPS_LIBS = $(foreach DEP, ${MODULE_DEPS}, $(subst lib,,$(firstword $(subst /, ,${DEP}))))
MODULE_LD_FLAGS = ${MODULE_DEPS_LIBS:%=-l%}
MODULE_LD_FLAGS += ${MODULE_DEPS_OUTPUT_LIBS_DIRS:%=-L%}

MODULE_TMP_TARGET_TEST = ${MODULE_OUTPUT_TMP_TEST_PATH}/${TEST_APP_NAME}


${MODULE_TMP_TARGET_TEST}:${MODULE_OUTPUT_TEST_OBJS}
	$(GCC) -o $@ $^ ${MODULE_LD_FLAGS}

MODULE_TARGET_TEST = ${MODULE_OUTPUT_TEST_PATH}/${TEST_APP_NAME}

endif
