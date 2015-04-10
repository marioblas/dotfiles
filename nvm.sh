#!/bin/bash

# Clone and checkout the latest NVM (Node Version Manager)
git clone https://github.com/creationix/nvm.git ~/.nvm
latest_release=`git --git-dir=$HOME/.nvm/.git --work-tree=$HOME/.nvm describe --abbrev=0 --tags`
git --git-dir=$HOME/.nvm/.git --work-tree=$HOME/.nvm checkout ${latest_release}
# Activate NVM (also included in .bash_profile)
source ~/.nvm/nvm.sh

# Install the latest version of Node
nvm install node

# Install the latest version of io.js
nvm install iojs
