# Zsh configuration file for both login mode and interactive mode
#
# .profile file in Bash

#
# General Settings
# ==============================================================================

#
# Prompt
# ------------------------------------------------------------------------------
export PS1="%~ $ "

#
# Command Alias
# ------------------------------------------------------------------------------

#
# Customize App
# ==============================================================================

#
# Homebrew
# ------------------------------------------------------------------------------
export BREW=/opt/homebrew/bin/brew

#
# Zsh
# ------------------------------------------------------------------------------

# ### Zsh Completion
#
# $ brew install zsh-completions
# $ rm -ff ~/.zcompdump; compinit
# $ chmod go-w '/opt/homebrew/share'
# $ chmod -R go-w '/opt/homebrew/share/zsh'
if type brew &>/dev/null; then
  fpath=(~/.zsh/completions $(brew --prefix)/share/zsh-completions $fpath)

  autoload -Uz compinit
  compinit
fi

# ### Zsh Color
#
autoload -Uz colors
colors
# Zsh autosuggestion
# ------------------------------------------------------------------------------
#
# $ brew install zsh-autosuggestions

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# Zsh syntax highlighting
# ------------------------------------------------------------------------------
#
# $ brew install zsh-syntax-highlighting

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ### Zsh Prompt for Apple Terminal
#
# see https://zenn.dev/sprout2000/articles/bd1fac2f3f83bc
# $ brew install zsh-git-prompt
if [ "$TERM_PROGRAM" = "Apple_Termanil" ]; then
  alias python="python3"
  if [ -f "$(brew --prefix zsh-git-prompt)/zshrc.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix zsh-git-prompt)/zshrc.sh"
  fi

  git_prompt() {
    # $'\n' で改行
    # see https://qiita.com/ko1nksm/items/af780da4a8ef8b1c5beb
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
      PROMPT='%B%~%b$(git_super_status)'$'\n''%F{white}[%T]%f %(!.#.$) '
    else
      PROMPT='%B%~%b'$'\n''%F{white}[%T]%f %(!.#.$) '
    fi
  }

  precmd() {
    git_prompt
  }
fi

# ### oh my posh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
fi

#
# Emacs
# ------------------------------------------------------------------------------
emacs_dir=$HOME/project/emacs-2024
alias emacs="open $emacs_dir/nextstep/Emacs.app/"
export GIT_EDITOR="$emacs_dir/lib-src/emacsclient"

#
# Eza -- Better ls
# ------------------------------------------------------------------------------
#
# brew install eza
# brew install tree

if [ -f "/opt/homebrew/bin/eza" ]; then
  alias ls='eza --git-ignore --icons --no-user'
  alias lt='eza --git-ignore --icons --no-user --tree '
  alias lt3='eza --git-ignore --icons --no-user --tree --level=3'
else
  alias ls='ls -kFG'
  alias lt='tree'
fi

#
# Rbenv
# ------------------------------------------------------------------------------
#
# $ brew install rbenv
# $ rbenv install --list
# $ rbenv install 3.3.4
# $ rbenv global  3.3.4
export PATH=$HOME/.rbenv/bin:$HOME/bin:$PATH
eval "$(rbenv init - zsh)"

#
# Zoxide -- Better cd
# ------------------------------------------------------------------------------
#
# brew install zoxcide

if type zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

#
# Local settings
# ==============================================================================

if [ -f ".zshrc.local" ]; then
  source ".zshrc.local"
fi

#
# Memo
# ==============================================================================

# .authinfo の中身を利用する方法
#
# authinfo_github=$(grep 'machine github.com' ~/.authinfo)
# username_github=$(echo $authinfo_github | awk '{print $4}')
# password_github=$(echo $authinfo_github | awk '{print $6}')
#
# export GITHUB_API_TOKEN=$password_github
