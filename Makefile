# -*- mode: makefile-gmake -*-

.PHONY: all
all: link

.PHONY: link
link:
	./link.sh

.PHONY: setup
setup:
	brew install stow

#
# Install
# ============================================================

.PHONY: install
install: install-cui install-programming

.PHONE: install-cui
install-cui:
	brew install --cask wezterm
	brew install --formula jandedobbeleer/oh-my-posh/oh-my-posh
	brew install bat
	brew install deskpad
	brew install eza
	brew install fd
	brew install fzf
	brew install git-delta
	brew install screen
	brew install starship
	brew install tldr
	brew install tmux
	brew install tree
	brew install zoxide
	brew install zsh
	brew install zsh-autosuggestions
	brew install zsh-completion
	brew install zsh-syntax-highlighting

.PHONY: install-programming
install-programming: install-programming-bash
	brew install lua
	brew install plantuml

.PHONY: install-programming-bash
install-programming-bash:
	brew install bash-language-server
