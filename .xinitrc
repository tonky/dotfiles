exec setxkbmap -layout us,ru -variant ,winkeys -option grp:caps_toggle,terminate:ctrl_alt_bksp,compose:ralt &

exec urxvtd -q -f &
exec xmodmap .Xmodmap &

# exec xscreensaver &

exec ~/.config/tonky/screens_init &

exec awesome
#xsetroot -cursor_name left_ptr
#exec xmonad
