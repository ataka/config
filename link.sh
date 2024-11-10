#!/usr/bin/env zsh

# ~/ に置く設定ファイル
stow --target ~ screen tmux

# ~/.config に置く設定ファイル
stow --dotfiles --target ~ git wezterm
