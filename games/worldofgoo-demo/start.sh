cd /opt/games/worldofgoo-demo
xterm -e 'dialog --msgbox "You are about to see the license for this game.\nYou may not play the game if you do not agree to the license.\nWhen you are done reading, please press \"Q\" and decide whether you agree to the license." 10 60 && lynx addons/eula.txt && dialog --defaultno --yesno "Do you accept this license?" 8 50 && worldofgoo'
