# -*- mode: makefile-gmake -*-
INSTALL = cp -p

GITCONFIG = $(HOME)/.gitconfig
SCREENRC = $(HOME)/.screenrc
ZSHCONFIG = $(ZPROFILE)
ZPROFILE = $(HOME)/.zprofile

INSTALL_CONFIG = $(GITCONFIG) $(SCREENRC) $(ZSHCONFIG)

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

#
# Zsh config
#
$(ZSHCONFIG): $(ZPROFILE)

$(ZPROFILE): ./.zprofile
	$(INSTALL) $< $@
