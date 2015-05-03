#!/bin/bash

# Make sure we are using the latest Homebrew and update recipes.
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh -s /usr/local/bin/bash`.
brew install bash
# Regular bash-completion package is held back to an older release, so we get latest from versions.
# github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install homebrew/versions/bash-completion2

# Install updated Git
# Note: Don't forget to export the PATH /usr/local/bin (included in .path)
# Check that it works by executing `which git`. It should return "/usr/local/bin/git"
brew install git

# Install Node.js and npm
brew install node

# Install MongoDB
brew install mongodb

# Remove outdated versions from the cellar
brew cleanup
