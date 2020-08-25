#!/usr/bin/env bash

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

# Install Starship Propmpt
brew install starship

# Install Zsh Autosuggestions
brew install zsh-autosuggestions

# Install updated Git
# Note: Don't forget to export the PATH /usr/local/bin (included in .path)
# Check that it works by executing `which git`. It should return "/usr/local/bin/git"
brew install git

# Install Node.js and npm
brew install node

# Install Yarn
brew install yarn

# Install MongoDB
brew install mongodb-community

# Install WiFi Password
brew install wifi-password

# Install Tree
brew install tree

# Install Fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-victor-mono

# Install Casks
brew cask install google-chrome
brew cask install rectangle
brew cask install visual-studio-code
brew cask install hyper
brew cask install insomnia
brew cask install responsively
brew cask install mongodb-compass
brew cask install figma
brew cask install nucleo
brew cask install imageoptim

# Remove outdated versions from the cellar
brew cleanup
