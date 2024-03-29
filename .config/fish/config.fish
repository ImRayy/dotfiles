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
set fish_vi_key_bindings                          # Enables vim keyhbinding

### EXPORT
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type


### SET MANPAGER

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
# set fish_color_normal '#32CD32'
# set fish_color_autosuggestion '#7d7d7d'
# set fish_color_command '#32CD32'
# set fish_color_error '#dc1a1a'
# set fish_color_param brcyan

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

### Setting up zoxide, z alternative
if type -q zoxide 
    zoxide init fish | source
else 
end

### Setting the starship prompt
if type -q starship
    starship init fish | source
else
end

### Environment Variables
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

if type -q kitty
    set -gx TERM 'xterm-kitty'
else 
end

#### Calling exernal scripts ####
source ~/.secret.fish
source ~/.config/fish/completions/alias.fish
source ~/.config/lf/icons/icons

