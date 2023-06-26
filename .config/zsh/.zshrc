#!/bin/bash

# functions
function source_files() {
    for file in "${@}"; do
        if [[ -f $file ]]; then
            source ${file}
        else
            echo "File not found: $file"
        fi
    done
}

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# Set case sensitive to false like Fish shell
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Customization Files
local zsh_scripts=(
    ~/.config/zsh/zsh_plugins

    # Using aliases same as fish
    ~/.config/fish/completions/alias.fish

    # Icons for lf file manager
    ~/.config/lf/icons/icons
)

source_files "${zsh_scripts[@]}"

# eval $(thefuck --alias)

# zoxide
if ! command -v z &>/dev/null; then
    eval "$(zoxide init zsh)"
else
    echo "zoxide not installed"
fi

# Extra paths
export PATH="/home/${USER}/.local/bin:$PATH"

# Environmental variables
source ~/.zsh_secrets

# Starship prompt
eval "$(starship init zsh)"
