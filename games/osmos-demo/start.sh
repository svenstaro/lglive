cd /opt/games/osmos-demo
zenity --info --text "You are about to see the license for this game.\nYou may not play the game if you do not agree to the license.\nWhen you are done reading, please press capital \"Q\" and decide whether you agree to the license." && xterm -e lynx addons/eula.txt && zenity --question --text "Do you accept this license?" && osmos-demo
