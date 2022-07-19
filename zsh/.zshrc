source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# Vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize autocompletion
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# Autoload external directory
fpath=($ZDOTDIR/external $fpath)

# Autoload prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Enable VI mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor to match nvim
autoload -Uz cursor_mode; cursor_mode

# Editing commands in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Jumping to parent directory
source $DOTFILES/zsh/external/bd.zsh

# Custom scripts
source $DOTFILES/zsh/scripts.sh

# Fzf completion
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# i3 startup use x and set randr
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
