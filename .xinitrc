exec setxkbmap -layout us,ru -variant ,winkeys -option grp:caps_toggle,terminate:ctrl_alt_bksp,compose:ralt &

exec urxvtd -q -f &

# exec xscreensaver &

exec ~/.config/tonky/screens_init &

exec ~/.config/tonky/marble.sh &

exec xset m 5 4 &

#xsetroot -cursor_name left_ptr
#exec xmonad
#exec openbox

# sleep 1

exec xmodmap .Xmodmap &

exec awesome
# exec openbox-session
