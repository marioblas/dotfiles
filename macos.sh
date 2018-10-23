#!/bin/bash

# Notes:
# - Show app defaults → `defaults read -app <application>`
# - Find the correct keys:
#   1. `defaults read -app <application> > before`
#   2. change the setting
#   3. `defaults read -app <application> > after`
#   4. `diff before after`
#   Reference:
#   https://github.com/mathiasbynens/dotfiles/issues/5#issuecomment-4117712

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

###############################################################################
# Typography                                                                  #
###############################################################################

cp ./init/*.ttf /Library/Fonts/

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" "Finder" "Dock"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
