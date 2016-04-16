# Mario's dotfiles

![](https://cloud.githubusercontent.com/assets/3719969/6882753/ce94c4f2-d588-11e4-8355-ba9afa58ee15.png)

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
