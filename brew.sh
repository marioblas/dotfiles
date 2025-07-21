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

# Install Zsh Plugins
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

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
brew install font-fira-code
brew install font-victor-mono
brew install font-cascadia-code

# Install Casks
brew install rectangle
brew install cloudflare-warp
brew install google-chrome
brew install arc
brew install visual-studio-code
brew install warp
brew install iina
brew install nucleo
brew install responsively
brew install mongodb-compass

# Remove outdated versions from the cellar
brew cleanup
