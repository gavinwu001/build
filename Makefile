export ROOTDIR = $(shell pwd)/..

include $(ROOTDIR)/build/config/env.mk

host_tools:
	$(MAKE) -C $(ROOTDIR)/host-tools all

build_modules = $(modules:%=build_%)
$(build_modules):
	$(MAKE) -C $(MODULES_SRC_DIR)/$(@:build_%=%) module_build

build_3rd = $(3rd:%=build_%)
$(build_3rd):
	$(MAKE) -C $(3RD_SRC_DIR)/$(@:build_%=%) 3rd_build


build: $(build_3rd) $(build_modules)

clean_modules = $(modules:%=clean_%)
$(clean_modules):
	$(MAKE) -C $(MODULES_SRC_DIR)/$(@:clean_%=%) module_clean

clean_3rd = $(3rd:%=clean_%)
$(clean_3rd):
	$(MAKE) -C $(3RD_SRC_DIR)/$(@:clean_%=%) 3rd_clean


clean: $(clean_3rd) $(clean_modules)

rebuild: clean build

test_modules = $(modules:%=test_%)
$(test_modules):
	$(MAKE) -C $(MODULES_SRC_DIR)/$(@:test_%=%)/test module_test

test: $(test_modules)

testclean_modules = $(modules:%=testclean_%)

$(testclean_modules):
	$(MAKE) -C $(MODULES_SRC_DIR)/$(@:testclean_%=%)/test module_testclean

testclean: $(testclean_modules)
