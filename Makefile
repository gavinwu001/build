export rootdir = $(shell pwd)/..

include $(rootdir)/build/config/env.mk

host-tools:
	$(MAKE) -C $(rootdir)/host-tools all


