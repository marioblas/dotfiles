fpath=( "$HOME/.zfunctions" $fpath )

# Load default dotfiles
source ~/.bash_profile

# Modules
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Remove percent sign at the beginning
# https://superuser.com/questions/645599/why-is-a-percent-sign-appearing-before-each-prompt-on-zsh-in-windows
unsetopt PROMPT_SP

# Load Starship
eval "$(starship init zsh)"

# Load Fast Syntax Highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Load Completion

# Load Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load History config
source ~/.zsh/history.zsh

# Load Key Bindings config
source ~/.zsh/key-bindings.zsh
