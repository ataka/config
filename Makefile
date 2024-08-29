# -*- mode: makefile-gmake -*-
INSTALL = cp -p

GITCONFIG = $(HOME)/.gitconfig
SCREENRC = $(HOME)/.screenrc

INSTALL_CONFIG = $(GITCONFIG) $(SCREENRC)

.PHONY: install
install: $(INSTALL_CONFIG)

#
# .gitconfig
#
$(GITCONFIG): ./.gitconfig
	$(INSTALL) $< $@

#
# .screenrc
#
$(SCREENRC): ./.screenrc
	$(INSTALL) $< $@
