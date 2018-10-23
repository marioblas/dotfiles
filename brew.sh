#!/bin/bash

# Make sure we are using the latest Homebrew and update recipes.
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh -s /usr/local/bin/bash`.
# sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# chsh -s /usr/local/bin/bash
brew install bash

# Regular bash-completion package is held back to an older release, so we get latest from versions.
# https://github.com/Homebrew/homebrew-core/blob/master/Formula/bash-completion.rb#L1-L2
brew install bash-completion2

# Install Zsh
# Note: don’t forget to add `/usr/local/bin/zsh` to `/etc/shells` before running `chsh -s /usr/local/bin/zsh`.
# sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
# chsh -s /usr/local/bin/zsh
brew install zsh

# Install Zsh syntax highlighting
brew install zsh-syntax-highlighting

# Install updated Git
# Note: Don't forget to export the PATH /usr/local/bin (included in .path)
# Check that it works by executing `which git`. It should return "/usr/local/bin/git"
brew install git

# Install Node.js and npm
brew install node

# Install Yarn
brew install yarn

# Install MongoDB
brew install mongodb

# Install HTTPie
brew install httpie

# Install ImageMagick
brew install imagemagick

# Install WebP
brew install webp

# Install WiFi Password
brew install wifi-password

# Install Tree
brew install tree

# Remove outdated versions from the cellar
brew cleanup
