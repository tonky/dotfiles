setxkbmap -layout "us,ru,uk" -variant ,winkeys -option grp:caps_toggle &

urxvtd -q -f &

~/.config/dotfiles/marble.sh &

~/.config/dotfiles/screens_init &

xset m 1 1 &
xset s 1800 1800 &

xmodmap ~/.Xmodmap &
mpd &

/usr/bin/dispwin -d1 /home/tonky/.config/dotfiles/viewsonic_vx2770.icm &
/usr/bin/dispwin -d2 /home/tonky/.local/share/dispcalGUI/storage/SyncMaster\ 2013-09-20\ D6500\ 2.2\ MQ\ 1xCurve+MTX/SyncMaster\ 2013-09-20\ D6500\ 2.2\ MQ\ 1xCurve+MTX.icc &

awesome
#e16
#xmonad
