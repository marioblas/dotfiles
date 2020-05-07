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

# Load Starship Prompt
eval "$(starship init zsh)"

# Load Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load Fast Syntax Highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Load History config
source ~/.zsh/history.zsh

# Load Key Bindings config
source ~/.zsh/key-bindings.zsh

# Load Completion config
source ~/.zsh/completion.zsh
# Initialize the completion system
autoload -Uz compinit
# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [[ $(date +'%j') != $updated_at ]]; then
  compinit -i
else
  compinit -C -i
fi
# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist
