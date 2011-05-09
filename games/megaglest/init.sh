install -D -m644 /opt/games/megaglest/addons/glest.ini /home/gamer/.config/megaglest/glest.ini
xres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f1)
yres=$(xrandr -q | grep \* | sed -e "s/^[ \t]*//" -e "s/\([0-9]*x[0-9]*\).*/\1/" | cut -d'x' -f2)
sed -i -e "s/XXXX/$xres/" -e "s/YYYY/$yres/" /home/gamer/.config/megaglest/glest.ini
chown -R gamer:users /home/gamer/.config/megaglest/
