# Mario's dotfiles

![](https://cloud.githubusercontent.com/assets/3719969/14582971/23fa4a0e-040c-11e6-93d2-1ce8d9d1951c.png)

## Setup

### Installation
- Fork & clone the repo
- Read and run parts of `setup-a-new-machine.sh`
- Add your `.gitconfig.local` file (see .gitconfig file notes)
- Read and run `symlink-setup.sh`
- Enjoy!

### Add new dotfiles
Just `cd` to your `dotfiles` repository, add your new dotfiles and then:
```bash
source symlink-setup.sh
```

## Summary of files

### Automatic config
* `.vimrc`
* `.inputrc`

### Shell
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.zshrc`
* `.exports`
* `.functions`
* `.path`

### Editor
* `.editorconfig` - More info at [editorconfig.org](http://editorconfig.org/).

### Git
* `.gitconfig`
* `.gitignore`

### Commands
* `bin/subl` - Sublime Text command line tool *subl* for OS X.
* `bin/wifi-password` - Get the password of the wifi you're on.

### Manual run
* `setup-a-new-machine.sh`
  * `brew.sh`, `brew-cask.sh`, `nvm.sh`, `npm.sh`, `osx.sh`
* `symlink-setup.sh`

## Private config
You can create a file `~/.extra` and add your private configuration.

My `~/.extra` looks something like this:
```bash
# Project aliases
alias dotfiles="cd ~/Projects/dotfiles"
...
```
Also you can use this file for override settings, functions and aliases.

## Thanks to...
This project is principally for personal use and is based on Mathias' and Paul's dotfiles.

## License
MIT © [marioblas](https://github.com/marioblas)
