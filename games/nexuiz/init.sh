mkdir -p /home/gamer/.nexuiz/data/
xres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f1)
yres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f2)
echo "vid_width \"$xres\"
vid_height \"$yres\"" > /home/gamer/.nexuiz/data/autoexec.cfg
