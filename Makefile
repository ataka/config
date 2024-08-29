# -*- mode: makefile-gmake -*-
INSTALL = install -C
SCREENRC = $(HOME)/.screenrc
INSTALL_CONFIG = $(SCREENRC)

.PHONY: install
install: $(INSTALL_CONFIG)

#
# .screenrc
#
$(SCREENRC): ./.screenrc
	$(INSTALL) $< $@
