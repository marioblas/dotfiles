# Mario's dotfiles

![](https://cloud.githubusercontent.com/assets/3719969/6882753/ce94c4f2-d588-11e4-8355-ba9afa58ee15.png)

## Installation

### General
The `bootstrap.sh` pulls the latest version and copy the files to `~`.
```bash
git clone https://github.com/marioblas/dotfiles.git && cd dotfiles && source bootstrap.sh
```
To update just `cd` to your `dotfiles` repository and then:
```bash
source bootstrap.sh
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

### Node/io.js packages
Install/update npm itself and npm packages.
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
# Git credentials
GIT_AUTHOR_NAME="Mario Blas"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="marioblas@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```
Also you can use this file for override settings, functions and aliases.

## Summary of files

### Shell
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.inputrc`
* `.path`
* `.extra` - Not included (see [private config](#private-config) section)

### Editor
* `.editorconfig` - More info at [editorconfig.org](http://editorconfig.org/)

### Git
* `.gitconfig`
* `.gitignore`

### Commands
* `bin/subl` - Sublime Text command line tool *subl* for OS X
* `bin/git-open` - Open the Github/Bitbucket/Gitlab... page for a repository using *git open*

## Thanks to...
This project is principally for me and is based on Mathias's dotfiles. His [repository](https://github.com/mathiasbynens/dotfiles) and [contributors](https://github.com/mathiasbynens/dotfiles/graphs/contributors) are awesome!

## License
MIT © [marioblas](https://github.com/marioblas)
