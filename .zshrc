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

# Load Pure
# Installed previously via npm
# Zsh prompt based on the Tomorrow Night Eighties theme.
# iTerm → Profiles → Text → use 14pt Droid Sans Mono.
prompt pure

# Npm command completion script
if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi

# Activate the syntax highlighting
# Note: this command must be at the end of ~/.zshrc
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
