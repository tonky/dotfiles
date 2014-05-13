alias p="sudo pacman"
alias pacsu="sudo pacman -Syu"
alias pas="pacaur -Ss"
alias pai="pacaur -S --noconfirm"
alias y="yaourt"
alias ys="yaourt -S --noconfirm"

alias fl="sudo fdisk -l"
alias v="vim"
alias s="sudo"
alias sv="sudo vim"
alias v="vim"
# alias c="cd"
alias l="ls -lha --color=auto --group-directories-first"
alias e="less"
alias pg="pgrep -fa"
alias g="git"
alias gpp="git pull && git push"
alias cl="clyde"
alias sk="sudo kill "
alias nl="nload -t 2000 -u K -U M"
alias bw="bwm-ng -t 2000"
alias nh="sudo nethogs wlan0"
alias yv="youtube-viewer"
alias pp="pep8 --repeat . && pylint --generated-members=objects -E ."
alias dt="PYTHONPATH=..:. nosetests -P --with-django -w . -e django"

alias hd="hg diff | less"
alias hs="hg status"
alias hl="hg log -l 20 -G | less"

alias ar="adb reboot"
alias arm="adb remount"
alias arr="adb reboot recovery"
alias arb="adb reboot bootloader"
alias amk="adb remount; adb push drivers/scsi/scsi_wait_scan.ko /system/modules/; adb push drivers/net/wireless/bcm4329/bcm4329.ko /system/modules/ && adb reboot bootloader && sudo fastboot flash zimage arch/arm/boot/zImage && sudo fastboot reboot"

alias lsm="mount | column -t"
alias hoff="xrandr --output DVI-1 --left-of DVI-0 --mode 1920x1200"
alias hon="xrandr --output HDMI-0 --right-of DVI-0 --mode 1280x720 && xrandr --output DVI-1 --off"

apm() {
    adb push $1 /system/modules/
}

aps() {
    adb push $1 /sdcard/download/
}

alias ffz="sudo fastboot flash zimage"
alias ffr="sudo fastboot flash radio"
alias fr="sudo fastboot reboot"

alias cv="adb shell cat /sys/kernel/debug/acpuclock/current_vdd"

alias mp="nosleep mplayer -zoom"

alias dsta="sudo systemctl start "
alias dres="sudo systemctl restart "
alias dsto="sudo systemctl stop "
alias den="sudo systemctl enable "
alias ddis="sudo systemctl disable "
alias dstat="sudo systemctl status "

c() {
    cd $1
    ls -lh --color
    if [ -e .venv ]; then
         workon `cat .venv`
    fi
}

gr() {
    if [ "`which ack`" != "ack not found" ] ; then
        ack -ir $1 * $2
    else
        grep -ir $1 * $2
    fi
}

fnd() {
    find . -iname "*$1*"
}

# extract archives.  should handle multiple files.
function x() {
     case $@ in 
         *.tar.bz2)     tar -xvjf "$@"  ;;  
         *.tar.gz)      tar -xvzf "$@"  ;;
         *.bz2)     bunzip2 "$@"    ;;
         *.rar)     unrar x "$@"    ;;
         *.gz)      gunzip "$@" ;;
         *.tar)         tar xf "$@" ;;
         *.tbz2)        tar -xvjf "$@"  ;;
         *.tgz)     tar -xvzf "$@"  ;;
         *.zip)     unzip "$@"      ;;
         *.xpi)     unzip "$@"      ;;
         *.Z)       uncompress "$@" ;;
         *.7z)      7z x "$@"   ;;
         *.ace)     unace e "$@"    ;;
         *.arj)     arj -y e "$@"   ;;
         *)         echo "'$@' cannot be extracted via x()" ;;
     esac
}

# packs $2-$n into $1 depending on $1's extension.  add more file types as needed
function pack() {
     if [ $# -lt 2 ] ; then
        echo -e "\npack() usage:"
        echo -e "\tpack archive_file_name file1 file2 ... fileN"
        echo -e "\tcreates archive of files 1-N\n"
     else 
       DEST=$1
       shift

       case $DEST in 
        *.tar.bz2)      tar -cvjf $DEST "$@" ;;  
        *.tar.gz)       tar -cvzf $DEST "$@" ;;  
        *.zip)          zip -r $DEST "$@" ;;
        *.xpi)          zip -r $DEST "$@" ;;
        *)              echo "Unknown file type - $DEST" ;;
       esac
     fi
}

# Prevents x from sleeping while program is running.  Args are program to run, ie "nosleep mplayer file.avi"
function nosleep() {
    # if this still doesn't work, fork $@ and run deactivate or reset periodically
    xset -dpms
    xset s off
    $@
    xset +dpms
    xset s on
}

bindkey -e

PS1="$(print '%{\e[1;33m%}[%T] %{\e[1;32m%}%n@%m%{\e[0m%}')$ "
RPROMPT=$(print '%{\e[0;34m%}%~%{\e[0m%}')

PATH=$PATH:/home/tonky/bin/:/opt/android-sdk/platform-tools:/opt/google-appengine:.:..

export EDITOR="/usr/bin/vim"
export NOSE_WITH_CHERRYPYLIVESERVER=1
export PACMAN=pacman
# export ARCH=arm
# export CCOMPILER=/opt/android-ndk/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin/arm-linux-androideabi-
# export CROSS_COMPILE=$CCOMPILER
export XDG_CACHE_HOME="/var/tmp"
export XZ_OPT="-T 0"


# export PYTHONDONTWRITEBYTECODE=1

# virtualenvwrapper stuff
export WORKON_HOME=~/projects/envs

source ~/.zshrc_local

# setopt promptsubst
# autoload -U promptinit
# promptinit
# prompt wunjo

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=15
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/tonky/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
setopt hist_ignore_all_dups
# End of lines configured by zsh-newuser-install
