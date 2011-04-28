#!/bin/sh
# ~~/.xinitrc
#
# Executed by startx (run your window manager from here)

for game in /opt/games/*; do
    $game/init.sh
done

numlockx&
xsetroot -cursor_name watch
#xsetroot -cursor_name left_ptr
feh --bg-fill ~/.blackbox/Backgrounds/wallpaper.png

#devilspie&
/opt/bin/greeter.sh&

# enable ctrl-alt-backspace again for easy x-killage
setxkbmap -option terminate:ctrl_alt_bksp&

( sleep 5 && /opt/bin/wbar_restore )&

exec blackbox
