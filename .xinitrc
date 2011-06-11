setxkbmap -layout us,ru -variant ,winkeys -option grp:caps_toggle,terminate:ctrl_alt_bksp,compose:ralt &

urxvtd -q -f &

~/.config/tonky/marble.sh &

~/.config/tonky/screens_init &

xset m 5 3 &
xset s 1800 1800 &

xmodmap ~/.Xmodmap &

awesome
