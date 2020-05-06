fpath=( "$HOME/.zfunctions" $fpath )

# Load default dotfiles
source ~/.bash_profile

# Modules
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History options
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=$HISTSIZE
# History management
# See: http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history
setopt inc_append_history
setopt share_history

# Keybindings
bindkey "^[[H" beginning-of-line  # [Fn + ←]
bindkey "^[[F" end-of-line        # [Fn + →]

# Load Starship
eval "$(starship init zsh)"

# Load Fast Syntax Highlighting
source ~/.zsh/fast-syntax-highlighting.plugin.zsh

# Load Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
