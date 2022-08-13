#    _____      __
#   / __(_)____/ /_
#  / /_/ / ___/ __ \
# / __/ (__  ) / / /
#/_/ /_/____/_/ /_/

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type


### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal '#32CD32'
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command '#32CD32'
set fish_color_error '#dc1a1a'
set fish_color_param brcyan



# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end


### END OF FUNCTIONS ###

### ALIASES ###
#\x1b[2J   <- clears tty
#\x1b[1;1H <- goes to (1, 1) (start)


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
alias pacin="sudo pacman -S"
alias pacrem= "sudo pacman -Rns"
alias pacrem="sudo pacman -Runs"
alias pacreps="pacman -Ss"
alias pacupd="sudo pacman -Sy"
alias pacupg="sudo pacman -Syu"
alias pacremorph="sudo pacman -Rns (pacman -Qdtq)"
alias paccache="sudo pacman -Sc"
alias allpaccache="sudo pacman -Scc"


# yay
alias yain="yay -S"
alias yarem="yay -Rns"
alias yaorph="yay -Qtd"
alias yaupd="yay -Sy"
alias yaupg="yay -Sua"
alias yayupd="yay -Sy"
alias yayreps="yay -Ss"
alias yaycache="yay -Sc"
alias yayremdep="yay -Yc"


# Pamac
alias pin="pamac build"
alias prem="pamac remove"
alias psearch="pamac search"

# NoteEditor
alias nvide=neovide

# Paru
alias pain="paru -S"
alias parem="paru -Rns"
alias paupd='paru -Sy'
alias paupg='paru -Sua'
alias parem='paru -Rns'
alias paorph='paru -Qtd'

# youtube-dlp
alias ytaudio="yt-dlp -x --audio-format mp3"

# Others
alias py=python		
alias gt=gotop		
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sync="bash /home/imray/sync.sh"
alias cat=bat
alias ka=killall

# Copy using rsync [ with progress bar ]
alias rcp="rsync -r -avz --progress"
alias rmv="rsync -r -avz --progress --remove-source-files"

# Other programs
alias csend='croc send --code'
alias scrcpylbr='scrcpy --bit-rate 2M'
alias rmmetad='exiftool -all= -overwrite_original'
alias rmametad='exiftool -all= -overwrite_original -ext'
alias won='nmcli radio wifi on'
alias woff='nmcli radio wifi off'
alias cdns='sudo nvim /etc/resolv.conf'
alias matrix='unimatrix'
alias na='nm-applet'
alias anime='~/Downloads/GIT/ani-cli/ani-cli'
alias g='greenclip'
alias gp='greenclip print'
alias music='ncmpcpp'
alias of='onefetch'
alias pf='pfetch'
alias nf='neofetch'
alias aquarium=asciiquarium 
alias lf='~/.config/lf/scripts/lfrun'
alias updmirror="cp /etc/pacman.d/mirrorlist ~/backup && cd ~/backup && mv mirrorlist mirrorlist_(date "+%Y-%m-%d-%T").bak && cd $HOME && sudo reflector --latest 20 --age 1 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && echo 'mirrorlist successfully updated'"

# Clean-Up
alias checkcache="du -sh .cache/"
alias clearcache="rm -rf .cache/*"
alias checkjournal="du -sh /var/log/journal"
alias clearjournal="sudo journalctl --vacuum-time=2weeks"

#### Calling a exernal scripts ####
#source ~/personalALias
source ~/.config/lf/icons/icons

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

