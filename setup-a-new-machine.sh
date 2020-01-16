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

# Install Homebrew packages
./brew.sh


###############################################################################
# Install of common things
###############################################################################

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Switch to using brew-installed Bash as default shell
# Hyper runs system's login shell by default... it takes effect on next login
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Switch to using brew-installed Zsh as default shell
# Hyper runs system's login shell by default... it takes effect on next login
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;


###############################################################################
# Node stuff
###############################################################################

# Install/update npm itself and npm packages.
./npm.sh


###############################################################################
# VS Code editor
###############################################################################

# Install extensions
./vscode-extensions.sh

# Import settings
cp ./init/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json


###############################################################################
# Remaining configuration
###############################################################################

# Set some sensible macOS defaults
# IMPORTANT: Read the entire file first
./macos.sh
