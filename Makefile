# -*- mode: makefile-gmake -*-
INSTALL = cp -p

GITCONFIG = $(HOME)/.gitconfig
SCREENRC = $(HOME)/.screenrc
ZPROFILE = $(HOME)/.zprofile
ZSHRC    = $(HOME)/.zshrc

.PHONY: config
config: $(ZPROFILE) $(ZSHRC) $(SCREENRC) $(GITCONFIG)

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
$(ZPROFILE): ./.zprofile
	$(INSTALL) $< $@

$(ZSHRC): ./.zshrc
	$(INSTALL) $< $@
