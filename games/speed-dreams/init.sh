install -D -m644 /opt/games/speed-dreams/addons/screen.xml /home/gamer/.speed-dreams/config/screen.xml
xres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f1)
yres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f2)
sed -i -e "s/XXXX/$xres/" -e "s/YYYY/$yres/" /home/gamer/.speed-dreams/config/screen.xml
chown -R gamer:users /home/gamer/.speed-dreams/
