setxkbmap -layout "us,ru" -variant ,winkeys -option grp:caps_toggle &

urxvtd -q -f &

~/.config/dotfiles/marble.sh &

~/.config/dotfiles/screens_init &

xset m 5 3 &
xset s 1800 1800 &

xmodmap ~/.Xmodmap &

awesome
#e16
#xmonad
