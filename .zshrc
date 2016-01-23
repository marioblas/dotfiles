fpath=( "$HOME/.zfunctions" $fpath )

# Load default dotfiles
source ~/.bash_profile

# Modules
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Load Pure
# Installed previously via npm
# Zsh prompt based on the Tomorrow Night Eighties theme.
# iTerm → Profiles → Text → use 15pt Droid Sans Mono.
prompt pure

# Activate the syntax highlighting
# Note: this command must be at the end of ~/.zshrc
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
