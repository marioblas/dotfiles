#!/bin/bash

# To maintain Homebrew Cask use:
# brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# Homebrew Cask
# http://caskroom.io/

# Install Homebrew Cask Versions
# https://github.com/caskroom/homebrew-versions
# brew tap caskroom/versions

# Quick Look plugins:
# https://github.com/sindresorhus/quick-look-plugins

# QLImageSize
brew cask install qlimagesize

# QLMarkdown
brew cask install qlmarkdown

# Clean up cached downloads
brew cask cleanup
