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

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Finder                                                                      #
###############################################################################

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Note: this cannot be done from within iTerm...

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Show border around window
defaults write com.googlecode.iterm2 UseBorder -bool true

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

###############################################################################
# Transmission                                                                #
###############################################################################

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" "Finder" "Transmission"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
