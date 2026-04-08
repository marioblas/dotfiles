# Copy paste this file in bit by bit.
# Don't run it.
echo "Do not run this script in one go. Hit Ctrl-C NOW"
read -n 1

###############################################################################
# Xcode
###############################################################################

xcode-select --install

###############################################################################
# Homebrew
###############################################################################

# Install Homebrew
# http://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
./brew.sh

###############################################################################
# Install of common things
###############################################################################

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Switch to using brew-installed Zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

###############################################################################
# Zsh
###############################################################################

# Directory to store plugins
mkdir ~/.zsh

# Download History config
curl -o ~/.zsh/history.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/history.zsh

# Download Key Bindings config
curl -o ~/.zsh/key-bindings.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/key-bindings.zsh

# Download Completion config
curl -o ~/.zsh/completion.zsh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh

# Fix insecure directories and files error
# See: https://github.com/zsh-users/zsh-completions/issues/680
compaudit | xargs chmod g-w

###############################################################################
# nvm, node, npm, pnpm, bun
###############################################################################

# File to load nvm
# https://github.com/nvm-sh/nvm#troubleshooting-on-macos
touch ~/.zshrc

# Install Node Version Manager
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Install the latest release of node
nvm install node

# Install/update npm packages.
./npm.sh

# Install pnpm
# https://pnpm.io/es/installation
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install Bun
# https://github.com/oven-sh/bun
curl -fsSL https://bun.sh/install | bash

###############################################################################
# AI coding agents
###############################################################################

# Install OpenCode
curl -fsSL https://opencode.ai/install | bash

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

###############################################################################
# Remaining configuration
###############################################################################

# Set some sensible macOS defaults
# IMPORTANT: Read the entire file first
./macos.sh
