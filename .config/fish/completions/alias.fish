alias cat=bat
alias py=python3
### ALIASES ###
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)

# General
alias c=clear
alias e=exit
alias ka=killall

# Navigation
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

# File managerment
alias ls="lsd --group-dirs first"
alias lf='~/.config/lf/scripts/lfrun'

# Pacman
alias pacq="pacman -Q | grep"
alias pacorph="pacman -Qdt"
alias pacin="sudo pacman -S"
alias pacrem="sudo pacman -Rns"
alias pacrem="sudo pacman -Runs"
alias pacreps="pacman -Ss"
alias pacupd="sudo pacman -Sy"
alias pacupg="sudo pacman -Syu"
alias pacremorph="sudo pacman -Rns (pacman -Qdtq)"
alias paccache="sudo pacman -Sc"
alias allpaccache="sudo pacman -Scc"


# Yay
alias yain="yay -S"
alias yarem="yay -Rns"
alias yaorph="yay -Qtd"
alias yaupd="yay -Sy"
alias yaupg="yay -Sua"
alias yayupd="yay -Sy"
alias yayreps="yay -Ss"
alias yaycache="yay -Sc"
alias yayremdep="yay -Yc"

# Paru
alias pain="paru -S"
alias parem="paru -Rns"
alias paupd='paru -Sy'
alias paupg='paru -Sua'
alias parem='paru -Rns'
alias paorph='paru -Qtd'

# NoteEditor
alias nvide=neovide

# grub
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# youtube-dlp
alias ytaudio="yt-dlp -x --audio-format mp3"

# Copy using rsync [ with progress bar ]
alias rcp="rsync -r -avz --progress"
alias rmv="rsync -r -avz --progress --remove-source-files"

# Clean-Up
alias checkcache="du -sh .cache/"
alias clearcache="rm -rf .cache/*"
alias checkjournal="du -sh /var/log/journal"
alias clearjournal="sudo journalctl --vacuum-time=2weeks"

# trash-cli
alias trp="trash-put"
alias trl="trash-list"
alias trr="trash-restore"
alias tre="trash-empty"

# Fetch 
alias of='onefetch'
alias pf='pfetch'
alias nf='neofetch'

# Exif cleaner 
# Arch Linux: perl-image-exiftool
alias rmmetad='exiftool -all= -overwrite_original'
alias rmametad='exiftool -all= -overwrite_original -ext'

# nmcli
alias won='nmcli radio wifi on'
alias woff='nmcli radio wifi off'

# Applications
alias audiorelay='~/Applications/audiorelay/bin/AudioRelay'
alias nitch='~/Applications/git/nitchNerd'

# custom scripts 
alias printc='python3 ~/Github/mini-projects/Scripts/easy_print/evenodd_typer.py'
alias wallrename='bash ~/Github/mini-projects/Scripts/rename.sh'

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Other programs
alias na='nm-applet'
alias scrcpylbr='scrcpy --bit-rate 2M'
alias drivers='glxinfo | grep OpenGL'
alias csend='croc send --code'
alias updmirror="cp /etc/pacman.d/mirrorlist ~/backup && cd ~/backup && mv mirrorlist mirrorlist_(date "+%Y-%m-%d-%T").bak && cd $HOME && sudo reflector --latest 20 --age 1 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && echo 'mirrorlist successfully updated'"
