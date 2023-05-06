alias cat=bat
alias py=python3
### ALIASES ###
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)

# General
alias c=clear
alias e=exit
alias ka=killall
alias reloadfishconf='source ~/.config/fish/config.fish'

# Navigation alias cd1='cd ..' alias cd2="cd ../.."
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'

# File managerment
alias ls='lsd --group-dirs first'
alias lf='~/.config/lf/scripts/lfrun'
alias r=ranger
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard'
alias copydir='pwd | tr -d "\r\n" | pbcopy'
alias cv='rsync -poghb --backup-dir=/tmp/rsync -e -r /dev/null --progress --'

# Pacman
alias pacq='pacman -Q | grep'
alias pacorph='pacman -Qdt'
alias pacin='sudo pacman -S'
alias pacrem='sudo pacman -Rns'
alias pacrem='sudo pacman -Runs'
alias pacreps='pacman -Ss'
alias pacupd='sudo pacman -Sy'
alias pacupg='sudo pacman -Syu'
alias pacremorph='sudo pacman -Rns (pacman -Qdtq)'
alias paccache='sudo pacman -Sc'
alias allpaccache='sudo pacman -Scc'

# Yay
alias yain='yay -S'
alias yarem='yay -Rns'
alias yaorph='yay -Qtd'
alias yaupd='yay -Sy'
alias yaupg='yay -Sua'
alias yayupd='yay -Sy'
alias yayreps='yay -Ss'
alias yaycache='yay -Sc'
alias yayremdep='yay -Yc'

# Paru
alias pain='paru -S'
alias parem='paru -Rns'
alias paupd='paru -Sy'
alias paupg='paru -Sua'
alias parem='paru -Rns'
alias paorph='paru -Qtd'

# NoteEditor
alias nvide='neovide'

# grub
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# youtube-dlp
alias ytaudio='yt-dlp -x --audio-format mp3'

# Copy using rsync [ with progress bar ]
alias rcp='rsync -r -avz --progress'
alias rmv='rsync -r -avz --progress --remove-source-files'

# Clean-Up
alias checkcache='du -sh .cache/'
alias clearcache='rm -rf .cache/*'
alias checkjournal='du -sh /var/log/journal'
alias clearjournal='sudo journalctl --vacuum-time=2weeks'

# trash-cli
alias trp='trash-put'
alias trl='trash-list'
alias trr='trash-restore'
alias tre='trash-empty'

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

# npm 
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrs='npm run start'
alias ni='npm install --save'
alias nun='npm uninstall'
alias nisd='npm install --save-dev'
alias nip='npm install -P'

# gtk
alias gtkdark='gsettings set org.gnome.desktop.interface color-scheme prefer-dark'
alias gtklight='gsettings set org.gnome.desktop.interface color-scheme prefer-light'

# Grim/slurp
alias colorpick='grim -g "$(slurp -p)" -t ppm - | convert - -format "%[pixel:p{0,0}]" txt:-'

# Tmux
alias tls='tmux ls'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tns='tmux new -s'
alias tks='tmux kill-session -t'
alias tkas='tmux list-sessions | grep -v attached | awk "BEGIN{FS=\":\"}{print $1}" | xargs -n 1 tmux kill-session -t || echo "No sessions to kill"'

# Other programs
alias ngrok='~/Applications/ngrok/ngrok'
alias na='nm-applet'
alias hyp=hyprpicker
alias scrcpylbr='scrcpy --bit-rate 2M'
alias drivers='glxinfo | grep OpenGL'
alias csend='croc send --code'
