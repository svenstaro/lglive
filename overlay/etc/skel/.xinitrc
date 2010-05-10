#!/bin/sh
# ~~/.xinitrc
#
# Executed by startx (run your window manager from here)

numlockx&
xsetroot -cursor_name watch
#xsetroot -cursor_name left_ptr
feh --bg-fill ~/.blackbox/Backgrounds/wallpaper.png

/opt/bin/wbar_restore

#devilspie&
/opt/bin/greeter.sh&

# enable ctrl-alt-backspace again for easy x-killage
setxkbmap -option terminate:ctrl_alt_bksp&
exec blackbox
