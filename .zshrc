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
alias cl="clyde"
alias sc="sudo clyde"
alias nl="nload -t 2000 -u K -U M"
alias yv="youtube-viewer"
alias pp="pep8 --repeat . && pylint --generated-members=objects -E ."
alias dt="PYTHONPATH=..:. nosetests -P --with-django -w . -e django"

c() {
    cd $1
    ls -lh --color
}

gr() {
    grep -ir $1 *
}

bindkey -e

# PS1="[%T] %m:%~ "

PATH=$PATH:/home/tonky/bin/:/opt/android-sdk/tools

export EDITOR="/usr/bin/vim"
export DJANGO_SETTINGS_MODULE="settings"
export NOSE_WITH_CHERRYPYLIVESERVER=1

# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.
setopt promptsubst
 
# Load the prompt theme system
autoload -U promptinit
promptinit
 
# Use the wunjo prompt theme
prompt wunjo

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
# End of lines configured by zsh-newuser-install
