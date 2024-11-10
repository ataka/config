# -*- mode: makefile-gmake -*-

.PHONY: all
all: link

.PHONY: link
link:
	./link.sh

.PHONY: setup
setup:
	brew install stow

.PHONY: install
install:
	brew install jandedobbeleer/oh-my-posh/oh-my-posh
	brew install zsh
	brew install zsh-completion
	brew install zsh-autosuggestions
	brew install zsh-syntax-highlighting
	brew install eza
	brew install fzf
	brew install tree
	brew install zoxide
	brew install --cask wezterm
