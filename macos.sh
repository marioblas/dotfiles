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

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Note: this cannot be done from within iTerm...

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Show border around window
defaults write com.googlecode.iterm2 UseBorder -bool true

# Install the Tomorrow Night Eighties theme for iTerm
open "./init/Tomorrow Night Eighties.itermcolors"

###############################################################################
# Transmission                                                                #
###############################################################################

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Typography                                                                  #
###############################################################################

cp ./init/*.ttf /Library/Fonts/

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" "Finder" "Transmission"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
