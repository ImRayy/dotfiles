#!/bin/bash

function source_files() {
    for file in "${@}"; do
        [[ -f $file ]] && source $file
    done
}

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS          # Ignore duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS      # Remove older duplicate entries from the history
setopt HIST_FIND_NO_DUPS         # Do not display duplicates during history search
setopt INC_APPEND_HISTORY        # Append history instead of overwriting
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicates first when trimming history
setopt EXTENDED_HISTORY          # Record timestamp of command in history
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry

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

# fzf
source <(fzf --zsh)

# Starship prompt
command -v starship &>/dev/null && eval "$(starship init zsh)"

# Volta.sh
if [[ ! -d $HOME/.volta ]];then
    curl https://get.volta.sh | bash
else
    export VOLTA_HOME="$HOME/.volta"
fi

# Path
export PATH="$VOLTA_HOME/bin:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$HOME/go/bin:$PATH"
