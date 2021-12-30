#  __ _     _
# / _(_)___| |__
#| |_| / __| '_ \
#|  _| \__ \ | | |
#|_| |_|___/_| |_|


cowsay -f eyes "U can't see me I see  U now"
task
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

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

### END OF FUNCTIONS ###


### ALIASES ###
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)


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
alias pacremorph="sudo pacman -Rns (pacman -Qdtq)"


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
### SETTING THE STARSHIP PROMPT ###
starship init fish | source
