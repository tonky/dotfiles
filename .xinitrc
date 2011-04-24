exec setxkbmap -layout us,ru -variant ,winkeys -option grp:caps_toggle,terminate:ctrl_alt_bksp,compose:ralt &

exec urxvtd -q -f &

exec ~/.config/tonky/screens_init &

exec ~/.config/tonky/marble.sh &

exec xset m 5 3 &
exec xset s 1800 1800 &

# exec xmodmap ~/.Xmodmap &

exec awesome
