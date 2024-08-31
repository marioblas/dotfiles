#!/usr/bin/env bash

# Make sure we are using the latest Homebrew and update recipes.
brew update

# Upgrade any already-installed formulae
brew upgrade

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

# Install GitHub CLI
brew install gh

# Install WiFi Password
brew install wifi-password

# Install Cloudflare Tunnel
# https://developers.cloudflare.com/pages/how-to/preview-with-cloudflare-tunnel
brew install cloudflared

# Expo Orbit
# https://docs.expo.dev/build/orbit/
brew install expo-orbit

# Install Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-victor-mono

# Install Casks
brew install --cask rectangle
brew install --cask cloudflare-warp
brew install --cask google-chrome
brew install --cask arc
brew install --cask visual-studio-code
brew install --cask warp
brew install --cask figma
brew install --cask nucleo
brew install --cask responsively
brew install --cask mongodb-compass

# Remove outdated versions from the cellar
brew cleanup
