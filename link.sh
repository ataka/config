#!/usr/bin/env zsh

# ~/ に置く設定ファイル
stow --target ~ screen tmux zsh

# ~/.config に置く設定ファイル
stow --dotfiles --target ~ git wezterm

# ~/Library/Developer/Xcode に置く設定ファイル
stow --target ~/Library/Developer/Xcode Xcode
