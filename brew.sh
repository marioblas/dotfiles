#!/bin/bash

# Make sure we are using the latest Homebrew and update recipes.
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install updated Git
# Note: Don't forget to export the PATH /usr/local/bin (included in .path)
# Check that it works by executing `which git`. It should return "/usr/local/bin/git"
brew install git

# Install bash completion
# Note: Add next lines to .bash_profile (also included):
# if [ -f `brew --prefix`/etc/bash_completion ]; then
# 	. `brew --prefix`/etc/bash_completion
# fi
brew install bash-completion

# Install Node.js and npm
brew install node

# Remove outdated versions from the cellar
brew cleanup
