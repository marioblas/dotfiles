# Mario's dotfiles

![](https://cloud.githubusercontent.com/assets/3719969/6882753/ce94c4f2-d588-11e4-8355-ba9afa58ee15.png)

## Installation

### General
The `symlink-setup.sh` symlinks all the dotfiles to `~`.
```bash
git clone https://github.com/marioblas/dotfiles.git && cd dotfiles && source symlink-setup.sh
```
To update just `cd` to your `dotfiles` repository and then:
```bash
source symlink-setup.sh
```

### Homebrew packages
Requires [Homebrew](http://brew.sh/).
```bash
./brew.sh
```

### Homebrew Cask apps
Take a look at [Homebrew Cask](http://caskroom.io/) and [Homebrew Cask Versions](https://github.com/caskroom/homebrew-versions).
```bash
./brew-cask.sh
```

### Node / io.js

#### nvm
Installs [Node Version Manager](https://github.com/creationix/nvm), then some node and io.js versions.
```bash
./nvm.sh
```

#### npm
Installs/updates [npm](https://www.npmjs.com/) itself and npm packages.
```bash
./npm.sh
```

### Sensible OS X defaults
When setting up a new Mac, you may want to set some sensible OS X defaults:
```bash
./osx.sh
```

## Private config
You can create a file `~/.extra` and add your private configuration.

My `~/.extra` looks something like this:
```bash
# Aliases
alias p="cd ~/Projects"
alias dotfiles="cd ~/Projects/dotfiles"
```
Also you can use this file for override settings, functions and aliases.

## Summary of files

### Shell
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.zshrc`
* `.exports`
* `.functions`
* `.inputrc`
* `.path`
* `.extra` - Not included (see [private config](#private-config) section).

### Editor
* `.editorconfig` - More info at [editorconfig.org](http://editorconfig.org/).

### Git
* `.gitconfig`
* `.gitignore`

### Commands
* `bin/subl` - Sublime Text command line tool *subl* for OS X.
* `bin/wifi-password` - Get the password of the wifi you're on.

## Thanks to...
This project is principally for personal use and is based on Mathias' and Paul's dotfiles.

## License
MIT © [marioblas](https://github.com/marioblas)
