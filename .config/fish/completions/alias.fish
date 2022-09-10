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

# Clean-Up
alias checkcache="du -sh .cache/"
alias clearcache="rm -rf .cache/*"
alias checkjournal="du -sh /var/log/journal"
alias clearjournal="sudo journalctl --vacuum-time=2weeks"

# Trash-cli
alias trp="trash-put"
alias trl="trash-list"
alias trr="trash-restore"
alias tre="trash-empty"

# Other programs
alias driver='glxinfo | grep OpenGL'
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

# GRUB
alias grubupd='sudo grub-mkconfig -o /boot/grub/grub.cfg '
