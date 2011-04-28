mkdir -p /home/gamer/.urbanterror/q3ut4/
xres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f1)
yres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f2)
echo "seta r_mode \"-1\"
seta r_customwidth \"$xres\"
seta r_customheight \"$yres\"" > /home/gamer/.urbanterror/q3ut4/autoexec.cfg
