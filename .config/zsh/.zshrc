#!/bin/bash

function source_files() {
    for file in "${@}"; do
        [[ -f $file ]] && source $file
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

# This will prevent the typed characters from being displayed on the terminal before loading zsh, followed by the % prompt.
unsetopt PROMPT_SP

# Set case sensitive to false like Fish shell
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Customization Files
local zsh_scripts=(

    ~/.config/zsh/zsh_functions
    ~/.config/zsh/zsh_plugins

    # Using aliases same as fish
    ~/.config/fish/completions/aliases.fish

    # Icons for lf file manager
    ~/.config/lf/icons/icons

    # Environmental variables
    ~/.zsh_secrets
)

source_files "${zsh_scripts[@]}"

# Extra paths
export PATH="/home/${USER}/.local/bin:$PATH"

# zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Starship prompt
command -v starship &>/dev/null && eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
