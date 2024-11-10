# -*- mode: makefile-gmake -*-

.PHONY: all
all: link

.PHONY: link
link:
	./link.sh

.PHONY: setup
setup:
	brew install stow
