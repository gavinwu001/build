export rootdir = $(shell pwd)/..

include $(rootdir)/build/config/env.mk

host_tools:
	$(MAKE) -C $(rootdir)/host-tools all

build_modules = $(modules:%=build_%)
$(build_modules):
	$(MAKE) -C $(modules-src-dir)/$(@:build_%=%) module_build

build: $(build_modules)

clean_modules = $(modules:%=clean_%)
$(clean_modules):
	$(MAKE) -C $(modules-src-dir)/$(@:clean_%=%) module_clean

clean: $(clean_modules)

