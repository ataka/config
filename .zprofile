#
# Zsh configuration file for login mode
#

## Set PATH, MANPATH, etc., for Homebrew.
#
eval "$(/opt/homebrew/bin/brew shellenv)"

## Local settings
#
if [ -f ".zprofile.local" ]; then
  source ".zprofile.local"
fi
