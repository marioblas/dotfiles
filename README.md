# Mario's dotfiles

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
* `.path`
* `.extra`

### Editor
* `.editorconfig` - More info [editorconfig.org](http://editorconfig.org/)

* `bin/subl` - Sublime Text OS X command line tool `subl`

### Git
* `.gitconfig`
* `.gitignore`

## Thanks to...
This project is principally for me and is based on [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles). His repository and contributors are awesome!
