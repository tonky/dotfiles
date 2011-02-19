alias p="sudo pacman"
alias pacsu="sudo pacman -Syu"
alias y="yaourt"

alias fl="sudo fdisk -l"
alias v="vim"
alias s="sudo"
alias sv="sudo vim"
alias v="vim"
# alias c="cd"
alias l="ls -lha --color"
alias e="less"
alias pg="pgrep -fl"
alias g="git"
alias gpp="git pull && git push"
alias cl="clyde"
alias sc="sudo clyde"
alias sc="sudo clyde"
alias scs="sudo clyde -S"
alias ss="sudo clyde -S --noconfirm"
alias nl="nload -t 2000 -u K -U M"
alias yv="youtube-viewer"
alias pp="pep8 --repeat . && pylint --generated-members=objects -E ."
alias dt="PYTHONPATH=..:. nosetests -P --with-django -w . -e django"

dsta() { sudo /etc/rc.d/$1 start }
dsto() { sudo /etc/rc.d/$1 stop }
dres() { sudo /etc/rc.d/$1 restart }

c() {
    cd $1
    ls -lh --color
}

gr() {
    grep -ir $1 *
}

fnd() {
    find . -iname "*$1*"
}

bindkey -e

PS1="$(print '%{\e[1;33m%}[%T] %{\e[1;32m%}%n@%m%{\e[0m%}')$ "
RPROMPT=$(print '%{\e[0;34m%}%~%{\e[0m%}')

PATH=$PATH:/home/tonky/bin/:/opt/android-sdk/tools

export EDITOR="/usr/bin/vim"
export DJANGO_SETTINGS_MODULE="settings"
export NOSE_WITH_CHERRYPYLIVESERVER=1
export PACMAN=pacman-color
export ARCH=arm
export CCOMPILER=/opt/android-ndk/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-
export CROSS_COMPILE=$CCOMPILER

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
