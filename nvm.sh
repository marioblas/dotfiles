#!/bin/bash

# Clone and checkout the latest NVM (Node Version Manager)
git clone https://github.com/creationix/nvm.git ~/.nvm
latest_release=`git --git-dir=$HOME/.nvm/.git --work-tree=$HOME/.nvm describe --abbrev=0 --tags`
git --git-dir=$HOME/.nvm/.git --work-tree=$HOME/.nvm checkout ${latest_release}
# Activate NVM (also included in .bash_profile)
source ~/.nvm/nvm.sh

# Install the latest v4.5.x release of Node
nvm install 4.5

# Use the system-installed version of Node
nvm use system
