fpath=( "$HOME/.zfunctions" $fpath )

# Load default dotfiles
source ~/.bash_profile

# Modules
autoload -U promptinit && promptinit

# Load pure prompt
prompt pure
