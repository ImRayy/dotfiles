# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#### HISTORY ####

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.histfile


# Lines configured by zsh-newuser-install End of lines configured by zsh-newuser-install The following lines were added by compinstall
zstyle :compinstall filename '/home/imray/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
#
#
#
autoload -Uz promptinit
promptinit
prompt fade blue
#


#### CUSTOM ALISES ####
# Basic
alias c=clear
alias e=exit

# Navigation
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

alias ls="lsd --group-dirs first"


# Pacman
alias pacq="pacman -Q | grep"
alias pacorph="pacman -Qdt"
alias pacqdtq="pacman -Qdtq"
alias pacin="sudo pacman -S"
alias pacrem= "sudo pacman -Rns"
alias pacrem="sudo pacman -Runs"
alias pacreps="pacman -Ss"
alias pacupd="sudo pacman -Sy"
alias pacupg="sudo pacman -Syu"
alias pacremorph="sudo pacman -Rns $(pacman -Qdtq)"


# yay
alias yain="yay -S"
alias yarem="yay -Rns"
alias yaorph="yay -Qtd"
alias yaupg="yay -Sya"
alias yayupd="yay -Sy"
alias yayreps="yay -Ss"


# Pamac
alias pin="pamac build"
alias prem="pamac remove"
alias psearch="pamac search"

# NoteEditor
alias nvide=neovide

# Paru
alias pain="paru -S"
alias parem="paru -Rns"

# youtube-dl
alias ytaudio="python yt -x --audio-format mp3"

# Others
alias py=python		
alias gt=gotop		# gotop (system monitor)
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias sync="bash /home/imray/sync.sh"
alias cat=bat
alias ka=killall
alias aquarium=asciiquarium

# Copy using rsync [ with progress bar ]
alias rcp="rsync -r -avz --progress"
alias rmv="rsync -r -avz --progress --remove-source-files"

# Other programs
alias csend="croc send --code"
alias nf=neofetch
alias ms="tdrop -am -w 20% -y 5% -x 79% kitty"
alias vw='nvim ~/Documents/Notes/vimwiki/index.md'

#### STARSHIP ####
eval "$(starship init zsh)"

#### PLUGINS ####


# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Auto suggestions
source  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/personalALias

#### Basic auto/tab complete ####
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

