# Copy paste this file in bit by bit.
# Don't run it.
echo "Do not run this script in one go. Hit Ctrl-C NOW"
read -n 1


###############################################################################
# Homebrew
###############################################################################

# Install Homebrew
# http://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew packages & Homebrew Cask apps
./brew.sh
./brew-cask.sh


###############################################################################
# Install of common things
###############################################################################

# Change to Bash 4 (installed by Homebrew)
BASHPATH=$(brew --prefix)/bin/bash
# sudo echo $BASHPATH >> /etc/shells
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X
# Later, confirm iTerm settings aren't conflicting.

# Change to Zsh (installed by Homebrew)
ZSHPATH=$(brew --prefix)/bin/zsh
# sudo echo $ZSHPATH >> /etc/shells
sudo bash -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells'
chsh -s $ZSHPATH # will set for current user only.
echo $ZSH_VERSION
# Later, confirm iTerm settings aren't conflicting.


###############################################################################
# Node stuff
###############################################################################

# Install Node Version Manager
./nvm.sh

# Install/update npm itself and npm packages.
./npm.sh

# Install Meteor
curl https://install.meteor.com/ | sh


###############################################################################
# Remaining configuration
###############################################################################

# Set some sensible macOS defaults
# IMPORTANT: Read the entire file first
./macos.sh

# Switch to macOS Dark Mode
# Note: requires dark-mode (installed with brew.sh)
dark-mode --mode Dark
